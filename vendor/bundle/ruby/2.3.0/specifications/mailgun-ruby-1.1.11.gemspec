# -*- encoding: utf-8 -*-
# stub: mailgun-ruby 1.1.11 ruby lib

Gem::Specification.new do |s|
  s.name = "mailgun-ruby"
  s.version = "1.1.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mailgun", "Travis Swientek"]
  s.date = "2018-10-12"
  s.description = "Mailgun's Official Ruby SDK for interacting with the Mailgun API."
  s.email = "support@mailgunhq.com"
  s.homepage = "http://www.mailgun.com"
  s.licenses = ["Apache-2.0"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.2")
  s.rubygems_version = "2.5.1"
  s.summary = "Mailgun's Official Ruby SDK"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.16.2"])
      s.add_development_dependency(%q<rspec>, ["~> 3.8.0"])
      s.add_development_dependency(%q<rake>, ["~> 12.3.1"])
      s.add_development_dependency(%q<webmock>, ["~> 3.4.2"])
      s.add_development_dependency(%q<pry>, ["~> 0.11.3"])
      s.add_development_dependency(%q<vcr>, ["~> 3.0.3"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.16.1"])
      s.add_development_dependency(%q<rails>, [">= 0"])
      s.add_runtime_dependency(%q<rest-client>, ["~> 2.0.2"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.16.2"])
      s.add_dependency(%q<rspec>, ["~> 3.8.0"])
      s.add_dependency(%q<rake>, ["~> 12.3.1"])
      s.add_dependency(%q<webmock>, ["~> 3.4.2"])
      s.add_dependency(%q<pry>, ["~> 0.11.3"])
      s.add_dependency(%q<vcr>, ["~> 3.0.3"])
      s.add_dependency(%q<simplecov>, ["~> 0.16.1"])
      s.add_dependency(%q<rails>, [">= 0"])
      s.add_dependency(%q<rest-client>, ["~> 2.0.2"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.16.2"])
    s.add_dependency(%q<rspec>, ["~> 3.8.0"])
    s.add_dependency(%q<rake>, ["~> 12.3.1"])
    s.add_dependency(%q<webmock>, ["~> 3.4.2"])
    s.add_dependency(%q<pry>, ["~> 0.11.3"])
    s.add_dependency(%q<vcr>, ["~> 3.0.3"])
    s.add_dependency(%q<simplecov>, ["~> 0.16.1"])
    s.add_dependency(%q<rails>, [">= 0"])
    s.add_dependency(%q<rest-client>, ["~> 2.0.2"])
  end
end
