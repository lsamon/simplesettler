# -*- encoding: utf-8 -*-
# stub: carrierwave-aws 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "carrierwave-aws"
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Parker Selbert"]
  s.date = "2017-09-27"
  s.description = "Use aws-sdk for S3 support in CarrierWave"
  s.email = ["parker@sorentwo.com"]
  s.homepage = "https://github.com/sorentwo/carrierwave-aws"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Native aws-sdk support for S3 in CarrierWave"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<carrierwave>, ["< 2.0", ">= 0.7"])
      s.add_runtime_dependency(%q<aws-sdk-s3>, ["~> 1.0"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.6"])
    else
      s.add_dependency(%q<carrierwave>, ["< 2.0", ">= 0.7"])
      s.add_dependency(%q<aws-sdk-s3>, ["~> 1.0"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3.6"])
    end
  else
    s.add_dependency(%q<carrierwave>, ["< 2.0", ">= 0.7"])
    s.add_dependency(%q<aws-sdk-s3>, ["~> 1.0"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3.6"])
  end
end
