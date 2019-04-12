# -*- encoding: utf-8 -*-
# stub: auto_strip_attributes 2.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "auto_strip_attributes"
  s.version = "2.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Olli Huotari"]
  s.date = "2018-09-06"
  s.description = "AutoStripAttributes helps to remove unnecessary whitespaces from ActiveRecord or ActiveModel attributes. It's good for removing accidental spaces from user inputs. It works by adding a before_validation hook to the record. It has option to set empty strings to nil or to remove extra spaces inside the string."
  s.email = ["olli.huotari@iki.fi"]
  s.homepage = "https://github.com/holli/auto_strip_attributes"
  s.licenses = ["MIT"]
  s.rubyforge_project = "auto_strip_attributes"
  s.rubygems_version = "2.5.1"
  s.summary = "Removes unnecessary whitespaces in attributes. Extension to ActiveRecord or ActiveModel."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 4.0"])
      s.add_development_dependency(%q<minitest>, [">= 2.8.1"])
      s.add_development_dependency(%q<mocha>, ["~> 0.14"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 4.0"])
      s.add_dependency(%q<minitest>, [">= 2.8.1"])
      s.add_dependency(%q<mocha>, ["~> 0.14"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 4.0"])
    s.add_dependency(%q<minitest>, [">= 2.8.1"])
    s.add_dependency(%q<mocha>, ["~> 0.14"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
