module Sidekiq
  module Worker

    ##
    # The Sidekiq testing infrastructure overrides perform_async
    # so that it does not actually touch the network.  Instead it
    # stores the asynchronous jobs in a per-class array so that
    # their presence/absence can be asserted by your tests.
    #
    # This is similar to ActionMailer's :test delivery_method and its
    # ActionMailer::Base.deliveries array.
    #
    # Example:
    #
    #   require 'sidekiq/testing'
    #
    #   assert_equal 0, HardWorker.jobs.size
    #   HardWorker.perform_async(:something)
    #   assert_equal 1, HardWorker.jobs.size
    #   assert_equal :something, HardWorker.jobs[0]['args'][0]
    #
    #   assert_equal 0, Sidekiq::Extensions::DelayedMailer.jobs.size
    #   MyMailer.delayed.send_welcome_email('foo@example.com')
    #   assert_equal 1, Sidekiq::Extensions::DelayedMailer.jobs.size
    #
    module ClassMethods
      alias_method :perform_async_old, :perform_async
      def perform_async(*args)
        jobs << { 'class' => self.name, 'args' => args }
        true
      end

      alias_method :perform_in_old, :perform_in
      alias_method :perform_at_old, :perform_at
      def perform_in(interval, *args)
        int = interval.to_f
        ts = (int < 1_000_000_000 ? Time.now.to_f + int : int)
        jobs << { 'class' => self.name, 'args' => args, 'at' => ts }
        true
      end
      alias_method :perform_at, :perform_in

      def jobs
        @pushed ||= []
      end

      def drain
        while job = jobs.shift do
          new.perform(*job['args'])
        end
      end
    end
  end
end
