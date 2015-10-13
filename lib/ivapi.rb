require 'ivapi/client'
require 'ivapi/default'

module Ivapi
  extend Ivapi::Configuration

  class << self
    def client
      unless defined?(@client) && @client.same_options?(options)
        @client = Ivapi::Client.new(options)
      end

      @client
    end

    private

    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end
  end
end

Ivapi.setup
