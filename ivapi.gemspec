lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ivapi/version'

Gem::Specification.new do |gem|
  gem.name = 'ivapi'
  gem.author = 'Justas Palumickas'
  gem.email = 'jpalumickas@gmail.com'
  gem.description = 'Gem which helps to communicate with https://www.iv.lt API.'
  gem.summary = 'Ruby wrapper for Interneto Vizija API.'
  gem.homepage = 'https://github.com/jpalumickas/ivapi/'
  gem.license = 'MIT'
  gem.required_ruby_version = '>= 2.1.0'
  gem.requirements << 'Interneto Vizija only allows to use API on their' \
                      'servers.'

  gem.files = `git ls-files -z`.split("\x0")
  gem.executables = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'faraday', '~> 0.10'
  gem.add_dependency 'faraday_middleware', '~> 0.10'
  gem.add_dependency 'hashie', '~> 3.5.5'

  gem.add_development_dependency 'bundler', '~> 1.6'
  gem.add_development_dependency 'rake', '~> 10.0'

  gem.version = Ivapi::VERSION
end
