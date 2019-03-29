# Ivapi

Gem which helps to communicate with Interneto vizija [https://www.iv.lt][iv.lt] ([https://wwww.dedikuoti.lt][dedikuoti.lt]) API.

[![Gem Version](https://img.shields.io/gem/v/ivapi.svg?style=flat-square)][rubygems]
[![Build Status](https://img.shields.io/travis/jpalumickas/ivapi.svg?style=flat-square)][travis]
[![Code Climate](https://img.shields.io/codeclimate/maintainability/jpalumickas/ivapi.svg?style=flat-square)][codeclimate]
[![Test Coverage](https://img.shields.io/codeclimate/c/jpalumickas/ivapi.svg?style=flat-square)][codeclimate_coverage]

## Installation

Add this line to your application's Gemfile:

```rb
gem 'ivapi'
```

And then execute:
```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install ivapi
```

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
```rb
Ivapi.account.orders
```

### Server information

Basic information
```rb
Ivapi.server.information
```


## Supported Ruby Versions

This library aims to support and is [tested against][travis] the following Ruby
versions:

* Ruby 2.1.0
* Ruby 2.2.0
* Ruby 2.3.0
* Ruby 2.4.0
* Ruby 2.5.0

## Copyright
Copyright (c) 2012-2019 Justas Palumickas.
See [LICENSE][license] for details.

[rubygems]: https://rubygems.org/gems/ivapi
[travis]: https://travis-ci.org/jpalumickas/ivapi
[codeclimate]: https://codeclimate.com/github/jpalumickas/ivapi
[codeclimate_coverage]: https://codeclimate.com/github/jpalumickas/ivapi/test_coverage

[iv.lt]: https://www.iv.lt
[dedikuoti.lt]: https://www.dedikuoti.lt
[license]: https://raw.githubusercontent.com/jpalumickas/ivapi/master/LICENSE
