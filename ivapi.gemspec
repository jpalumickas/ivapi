# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ivapi/version'

Gem::Specification.new do |gem|
  gem.name = 'ivapi'
  gem.author = 'Justas Palumickas'
  gem.email = 'jpalumickas@gmail.com'
  gem.description = 'Gem which helps to communicate with http://www.iv.lt API.'
  gem.summary = 'Ruby wrapper for working with Interneto Vizija API.'
  gem.homepage = 'https://github.com/jpalumickas/ivapi/'
  gem.license = 'MIT'
  gem.required_ruby_version = '>= 1.9.3'
  gem.requirements << 'Interneto Vizija allow to use API only on them servers.'

  gem.files = `git ls-files -z`.split("\x0")
  gem.executables = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'addressable', '~> 2.5'
  gem.add_dependency 'faraday', '~> 0.10'
  gem.add_dependency 'faraday_middleware', '~> 0.10'
  gem.add_dependency 'hashie', '~> 3.4'
  gem.add_dependency 'multi_json', '~> 1.12'

  gem.add_development_dependency 'bundler', '~> 1.6'
  gem.add_development_dependency 'rake', '~> 10.0'

  gem.version = Ivapi::VERSION
end
