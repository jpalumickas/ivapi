# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ivapi/version'

Gem::Specification.new do |gem|
  gem.name = 'ivapi'
  gem.author = 'Justas Palumickas'
  gem.email = 'jpalumickas@gmail.com'
  gem.description = %q{ Gem which helps to communicate with http://www.iv.lt API. }
  gem.summary = gem.description
  gem.homepage = 'https://github.com/jpalumickas/ivapi/'
  gem.license = 'MIT'

  gem.files = `git ls-files -z`.split("\x0")
  gem.executables = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'addressable', '~> 2.3'
  gem.add_dependency 'faraday', '~> 0.9.0'
  gem.add_dependency 'faraday_middleware', '~> 0.9.1'
  gem.add_dependency 'hashie', '~> 3.3'
  gem.add_dependency 'multi_json', '~> 1.10'
  gem.add_development_dependency 'bundler', '~> 1.7'
  gem.add_development_dependency 'rake', '~> 10.0'

  gem.version = Ivapi::VERSION
end
