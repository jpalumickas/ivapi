# Ivapi

Gem which helps to communicate with Interneto vizija [http://iv.lt][iv.lt] ([http://dedikuoti.lt][dedikuoti.lt]) API.

[![Gem Version](https://badge.fury.io/rb/ivapi.svg)][rubygems]
[![Build Status](https://secure.travis-ci.org/jpalumickas/ivapi.svg?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/jpalumickas/ivapi.png?travis)][gemnasium]
[![Coverage Status](http://img.shields.io/coveralls/jpalumickas/ivapi/master.svg)][coveralls]
[![Code Climate](http://img.shields.io/codeclimate/github/jpalumickas/ivapi.svg)][codeclimate]

## Installation

Add this line to your application's Gemfile:

    gem 'ivapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ivapi

## Usage

Create a new account at https://klientams.iv.lt/users.php with description "API".

### Authentication
```rb
Ivapi::Client.new(username: 'foo', password: 'bar')
```

Or create file under `config/initializers/ivapi.rb`

```rb
Ivapi.configure do |config|
  config.username = 'foo'
  config.password = 'bar'
end
```

### Account information

Basic information
```rb
Ivapi.account.information
```

Orders
```
Ivapi.account.orders
```

### Server information

Basic information
```rb
Ivapi.server.information
```

## Supported Ruby Versions

This library aims to support and is [tested against][travis] the following Ruby
implementations:

* Ruby 1.9.3
* Ruby 2.0.0
* Ruby 2.1.0

## Copyright
Copyright (c) 2012-2014 Justas Palumickas.
See [LICENSE][] for details.

[rubygems]: https://rubygems.org/gems/ivapi
[travis]: http://travis-ci.org/jpalumickas/ivapi
[gemnasium]: https://gemnasium.com/jpalumickas/ivapi
[coveralls]: https://coveralls.io/r/jpalumickas/ivapi
[codeclimate]: https://codeclimate.com/github/jpalumickas/ivapi

[iv.lt]: http://www.iv.lt
[dedikuoti.lt]: http://www.dedikuoti.lt
[license]: LICENSE.md
