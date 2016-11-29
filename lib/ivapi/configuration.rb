require 'faraday'
require 'ivapi/version'

module Ivapi
  module Configuration
    attr_accessor :server_id, :user_agent, :connection_options,
                  :web_endpoint, :api_endpoint, :username, :password

    def self.keys
      @keys ||= [
        :api_endpoint,
        :server_id,
        :username,
        :middleware,
        :password,
        :user_agent,
        :connection_options
      ]
    end

    def configure
      yield self
      true
    end

    # Reset configuration options to default values
    def reset!
      Ivapi::Configuration.keys.each do |key|
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
