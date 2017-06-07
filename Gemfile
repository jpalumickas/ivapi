source 'https://rubygems.org'

group :test do
  gem 'codeclimate-test-reporter', '~> 1.0', require: false
  gem 'coveralls', '~> 0.8', require: false
  gem 'rake' # We need a rake gem for Travis CI.
  gem 'rspec', '~> 3.6'
  gem 'rubocop', '~> 0.49'
  gem 'simplecov', '~> 0.14', require: false
  gem 'webmock', '~> 3.0'
end

platforms :rbx do
  gem 'psych'
  gem 'rubysl', '~> 2.2'
end

gemspec
