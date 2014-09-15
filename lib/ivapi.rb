require 'ivapi/client'
require 'ivapi/default'
require 'pry'

module Ivapi
  extend Ivapi::Configuration

  class << self
    def client
      unless defined?(@client) && @client.same_options?(options)
        @client = Ivapi::Client.new(options)
      end

      @client
    end

    def respond_to_missing?(method_name, include_private = false)
      client.respond_to?(method_name, include_private)
    end if RUBY_VERSION >= '1.9'

    def respond_to?(method_name, include_private = false)
      client.respond_to?(method_name, include_private) || super
    end if RUBY_VERSION < '1.9'

    private

    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end
  end
end

Ivapi.setup
