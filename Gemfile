# frozen_string_literal: true

source 'https://rubygems.org'

group :development do
  gem 'rubocop', '~> 0.75'
end

group :test do
  gem 'codecov', require: false
  gem 'rake' # We need a rake gem for Travis CI.
  gem 'rspec', '~> 3.8'
  gem 'simplecov', '~> 0.17', require: false
  gem 'webmock', '~> 3.7'
end

gemspec
