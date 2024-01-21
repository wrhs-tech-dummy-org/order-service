# -*- encoding: utf-8 -*-
# stub: sidekiq 2.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "sidekiq".freeze
  s.version = "2.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mike Perham".freeze]
  s.date = "2012-06-20"
  s.description = "Simple, efficient message processing for Ruby".freeze
  s.email = ["mperham@gmail.com".freeze]
  s.executables = ["sidekiq".freeze, "sidekiqctl".freeze]
  s.files = ["bin/sidekiq".freeze, "bin/sidekiqctl".freeze]
  s.homepage = "http://mperham.github.com/sidekiq".freeze
  s.licenses = ["LGPL-3.0".freeze]
  s.rubygems_version = "3.2.22".freeze
  s.summary = "Simple, efficient message processing for Ruby".freeze

  s.installed_by_version = "3.2.22" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<redis>.freeze, ["~> 3"])
    s.add_runtime_dependency(%q<redis-namespace>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<connection_pool>.freeze, ["~> 0.9.0"])
    s.add_runtime_dependency(%q<celluloid>.freeze, ["~> 0.11.0"])
    s.add_runtime_dependency(%q<multi_json>.freeze, ["~> 1"])
    s.add_development_dependency(%q<minitest>.freeze, ["~> 3"])
    s.add_development_dependency(%q<sinatra>.freeze, [">= 0"])
    s.add_development_dependency(%q<slim>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<actionmailer>.freeze, ["~> 3"])
    s.add_development_dependency(%q<activerecord>.freeze, ["~> 3"])
  else
    s.add_dependency(%q<redis>.freeze, ["~> 3"])
    s.add_dependency(%q<redis-namespace>.freeze, [">= 0"])
    s.add_dependency(%q<connection_pool>.freeze, ["~> 0.9.0"])
    s.add_dependency(%q<celluloid>.freeze, ["~> 0.11.0"])
    s.add_dependency(%q<multi_json>.freeze, ["~> 1"])
    s.add_dependency(%q<minitest>.freeze, ["~> 3"])
    s.add_dependency(%q<sinatra>.freeze, [">= 0"])
    s.add_dependency(%q<slim>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<actionmailer>.freeze, ["~> 3"])
    s.add_dependency(%q<activerecord>.freeze, ["~> 3"])
  end
end
