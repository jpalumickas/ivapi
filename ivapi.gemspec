# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ivapi/version'

Gem::Specification.new do |spec|
  spec.name = 'ivapi'
  spec.version = Ivapi::VERSION
  spec.author = 'Justas Palumickas'
  spec.email = 'jpalumickas@gmail.com'

  spec.summary = 'Ruby wrapper for Interneto Vizija API.'
  spec.description = 'Gem which helps to communicate with https://www.iv.lt ' \
                     'API.'
  spec.homepage = 'https://github.com/jpalumickas/ivapi'

  spec.requirements << 'Interneto Vizija only allows to use API on their ' \
                      'servers.'

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/jpalumickas/ivapi/issues',
    'changelog_uri' => 'https://github.com/jpalumickas/ivapi/releases',
    'source_code_uri' => 'https://github.com/jpalumickas/ivapi'
  }

  spec.license = 'MIT'

  spec.files         = `git ls-files -z`
    .split("\x0")
    .reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.5.0'

  spec.add_dependency 'faraday', '~> 1.0'
  spec.add_dependency 'faraday_middleware', '~> 1.0'
  spec.add_dependency 'hashie', '>= 3.5.5'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'codecov', '~> 0.1'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 0.82'
  spec.add_development_dependency 'simplecov', '~> 0.18'
  spec.add_development_dependency 'webmock', '~> 3.8'
end
