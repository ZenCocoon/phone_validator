# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = "phone_validator"
  s.version = '1.0.1'
  s.platform = Gem::Platform::RUBY
  s.authors = "Sebastien Grosjean"
  s.email = "public@zencocoon.com"
  s.homepage = "http://github.com/ZenCocoon/phone_validator"
  s.summary = "A phone validator for Rails 3+."
  s.description = "phone_validator makes phone validation natural for ActiveModel 3+ objects. Validation using global_phone."
  s.license = 'MIT'

  s.files = `git ls-files -- lib/*`.split("\n")
  s.test_files = `git ls-files -- {spec}/*`.split("\n")
  s.extra_rdoc_files = "README.md"
  s.rdoc_options = "--charset=UTF-8"
  s.require_path = "lib"

  s.add_runtime_dependency 'activemodel', '>= 3.0.0'
  s.add_runtime_dependency 'global_phone', '>= 1.0.1'

  s.add_development_dependency "rake", "~> 0.9"
  s.add_development_dependency "guard-rspec", "~> 1.0"
  s.add_development_dependency "appraisal", '~> 0.4'
end