# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ivapi/version'

Gem::Specification.new do |gem|
  gem.name = "ivapi"
  gem.authors = ["Justas Palumickas"]
  gem.email = ["justas@elish.lt"]
  gem.description = %q{ Gem which helps to communicate with iv.lt API }
  gem.summary = gem.description
  gem.homepage = "https://github.com/jpalumickas/ivapi/"
  gem.licenses = ['MIT']

  gem.files = `git ls-files`.split($/)
  gem.executables = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_dependency 'addressable', '~> 2.3'
  gem.add_dependency 'faraday', '~> 0.8'
  gem.add_dependency 'faraday_middleware', '~> 0.9'
  gem.add_dependency 'hashie', '~> 2.0'
  gem.add_dependency 'multi_json', '~> 1.8'

  gem.version = Ivapi::VERSION
end
