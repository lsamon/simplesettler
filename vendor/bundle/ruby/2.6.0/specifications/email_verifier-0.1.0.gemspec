# -*- encoding: utf-8 -*-
# stub: email_verifier 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "email_verifier".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kamil Ciemniewski".freeze]
  s.date = "2015-09-22"
  s.description = "Helper utility checking if given email address exists or not".freeze
  s.email = ["kamil@endpoint.com".freeze]
  s.homepage = "http://endpoint.com".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Helper utility checking if given email address exists or not".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dnsruby>.freeze, [">= 1.5"])
    else
      s.add_dependency(%q<dnsruby>.freeze, [">= 1.5"])
    end
  else
    s.add_dependency(%q<dnsruby>.freeze, [">= 1.5"])
  end
end
