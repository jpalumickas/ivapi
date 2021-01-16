# frozen_string_literal: true

require 'ivapi/client'
require 'ivapi/default'

module Ivapi
  extend Ivapi::Configuration

  class << self
    def client
      @client = Ivapi::Client.new(options) unless defined?(@client) && @client.same_options?(options)

      @client
    end

    private

    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)

      client.send(method_name, *args, &block)
    end

    def respond_to_missing?(method_name, include_private = false)
      client.respond_to?(method_name, include_private)
    end
  end
end

Ivapi.setup
