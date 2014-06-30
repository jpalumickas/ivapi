require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require 'ivapi'
require 'rspec'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow: 'coveralls.io')

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def stub_get(url)
  stub_request(:get, iv_url(url))
end

def stub_command(command, options = {})
  params = { command: command }
  params.merge!(options)
  client = @client || Ivapi.client
  params.merge!(client.authentication)
  stub_request(:get, 'https://api.iv.lt/json.php').with(query: params)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def json_response(file)
  {
    body: fixture(file),
    headers: {
      content_type: 'application/json; charset=utf-8'
    }
  }
end

def iv_url(url)
  if url =~ /^http/
    url
  else
    "https://api.iv.lt#{url}"
  end
end

def iv_command_url(command)
  if @client && @client.authenticated?
    iv_url("?nick=#{@client.username}&password=#{@client.password}&command=#{command}")
  else
    iv_url("?command=#{command}")
  end
end
