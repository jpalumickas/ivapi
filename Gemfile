source 'https://rubygems.org'

group :development do
  gem 'guard-rspec', '~> 4.7'
end

group :test do
  gem 'codeclimate-test-reporter', '~> 1.0', require: false
  gem 'coveralls', '~> 0.8', require: false
  gem 'rake' # We need a rake gem for Travis CI.
  gem 'rspec', '~> 3.5'
  gem 'simplecov', '~> 0.12', require: false
  gem 'webmock', '~> 2.3'
end

platforms :rbx do
  gem 'psych'
  gem 'rubysl', '~> 2.0'
end

gemspec
