source 'https://rubygems.org'

group :development do
  gem 'guard-rspec', '~> 4.7.3'
end

group :test do
  gem 'codeclimate-test-reporter', require: false
  gem 'coveralls', '~> 0.8.16', require: false
  gem 'rake' # We need a rake gem for Travis CI.
  gem 'rspec', '~> 3.5.0'
  gem 'simplecov', '~> 0.12', require: false
  gem 'webmock', '~> 2.1.0'
end

platforms :rbx do
  gem 'psych'
  gem 'rubysl', '~> 2.0'
end

gemspec
