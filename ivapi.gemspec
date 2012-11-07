# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ivapi/version'

Gem::Specification.new do |gem|
  gem.name          = "ivapi"
  gem.version       = Ivapi::VERSION
  gem.authors       = ["Justas Palumickas"]
  gem.email         = ["justas@elish.lt"]
  gem.description   = %q{ Gem which helps to communicate with iv.lt API }
  gem.summary       = %q{ Gem which helps to communicate with iv.lt API }
  gem.homepage      = "https://github.com/jpalumickas/ivapi/"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'httparty', '~> 0.9.0'
end
