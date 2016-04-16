# Ivapi

Gem which helps to communicate with Interneto vizija [http://iv.lt][iv.lt] ([http://dedikuoti.lt][dedikuoti.lt]) API.

[![Gem Version](http://img.shields.io/gem/v/ivapi.svg?style=flat-square)][rubygems]
[![Build Status](http://img.shields.io/travis/jpalumickas/ivapi.svg?style=flat-square)][travis]
[![Dependency Status](http://img.shields.io/gemnasium/jpalumickas/ivapi.svg?style=flat-square)][gemnasium]
[![Coverage Status](http://img.shields.io/coveralls/jpalumickas/ivapi/master.svg?style=flat-square)][coveralls]
[![Code Climate](http://img.shields.io/codeclimate/github/jpalumickas/ivapi.svg?style=flat-square)][codeclimate]

## Installation

Add this line to your application's Gemfile:

    gem 'ivapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ivapi

## Usage

> The Ivapi Wiki has lots of additional information about this gem including many examples. Please browse the Wiki at:
https://github.com/jpalumickas/ivapi/wiki

Create a new account at https://klientams.iv.lt/users.php with description "API".

### Authentication
```rb
client = Ivapi::Client.new(username: 'foo', password: 'bar')
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
* Ruby 2.2.0
* Ruby 2.3.0

## Copyright
Copyright (c) 2012-2015 Justas Palumickas.
See [LICENSE][] for details.

[rubygems]: https://rubygems.org/gems/ivapi
[travis]: http://travis-ci.org/jpalumickas/ivapi
[gemnasium]: https://gemnasium.com/jpalumickas/ivapi
[coveralls]: https://coveralls.io/r/jpalumickas/ivapi
[codeclimate]: https://codeclimate.com/github/jpalumickas/ivapi

[iv.lt]: http://www.iv.lt
[dedikuoti.lt]: http://www.dedikuoti.lt
[license]: LICENSE.md
