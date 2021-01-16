# frozen_string_literal: true

require 'faraday'
require 'ivapi/version'

module Ivapi
  module Configuration
    attr_accessor :username, :password, :user_agent, :connection_options,
      :web_endpoint, :api_endpoint, :server_id, :hosting_id

    def self.keys
      @keys ||= %i[
        api_endpoint
        username
        middleware
        password
        user_agent
        connection_options
        server_id
        hosting_id
      ]
    end

    def self.each_key(&block)
      keys.each(&block)
    end

    def configure
      yield self
      true
    end

    # Reset configuration options to default values
    def reset!
      Ivapi::Configuration.each_key do |key|
        instance_variable_set(:"@#{key}", Ivapi::Default.options[key])
      end
      self
    end
    alias setup reset!

    private

    def options
      Hash[
        Ivapi::Configuration.keys.map do |key|
          [key, instance_variable_get(:"@#{key}")]
        end
      ]
    end
  end
end
