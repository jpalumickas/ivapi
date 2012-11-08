# Ivapi

Gem which helps to communicate with iv.lt API

## Installation

Add this line to your application's Gemfile:

    gem 'ivapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ivapi

## Usage

```ruby
require 'ivapi'

API_NAME = "your_account_name" #You must to set it on https://klientams.iv.lt/users.php with description "API".
API_PASSWORD = "your_account_password"

account = Ivapi::Account.new(API_NAME, API_PASSWORD)

puts "Account name: #{account.info['ac_name']}"
puts "Account created: #{account.info['ac_created']}"

account.services.each do |order|
  puts "Id: #{order['se_id']} Description: #{order['se_description']}"
end

server = Ivapi::Server.new(API_NAME, API_PASSWORD).id(123) # Where is id, there is your service id.
server.tasks.each do |task| # can be: server.tasks(:count => 15) (Max: 1000)
	puts "Id: #{task['ta_id']} Command: #{task['ta_command']}"
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
