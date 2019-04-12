# -*- encoding: utf-8 -*-
# stub: record_tag_helper 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "record_tag_helper"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["David Heinemeier Hansson"]
  s.date = "2016-03-01"
  s.description = "ActionView Record Tag Helpers"
  s.email = "david@loudthinking.com"
  s.homepage = "https://github.com/rails/record_tag_helper"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "ActionView Record Tag Helpers"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionview>, ["~> 5.x"])
      s.add_development_dependency(%q<actionpack>, ["~> 5.x"])
      s.add_development_dependency(%q<activemodel>, ["~> 5.x"])
      s.add_development_dependency(%q<rake>, ["~> 10.4"])
      s.add_development_dependency(%q<mocha>, ["~> 1.1.0"])
    else
      s.add_dependency(%q<actionview>, ["~> 5.x"])
      s.add_dependency(%q<actionpack>, ["~> 5.x"])
      s.add_dependency(%q<activemodel>, ["~> 5.x"])
      s.add_dependency(%q<rake>, ["~> 10.4"])
      s.add_dependency(%q<mocha>, ["~> 1.1.0"])
    end
  else
    s.add_dependency(%q<actionview>, ["~> 5.x"])
    s.add_dependency(%q<actionpack>, ["~> 5.x"])
    s.add_dependency(%q<activemodel>, ["~> 5.x"])
    s.add_dependency(%q<rake>, ["~> 10.4"])
    s.add_dependency(%q<mocha>, ["~> 1.1.0"])
  end
end
