require 'faraday'
require 'ivapi/version'

module Ivapi
  module Configuration
    VALID_OPTIONS_KEYS = [
      :adapter,
      :faraday_config_block,
      :username,
      :password,
      :user_agent
    ].freeze

    DEFAULT_ADAPTER = Faraday.default_adapter
    DEFAULT_USER_AGENT = "Ivapi Ruby Gem #{Ivapi::VERSION}".freeze

    attr_accessor(*VALID_OPTIONS_KEYS)

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}){|o,k| o.merge!(k => send(k)) }
    end

    def faraday_config(&block)
      @faraday_config_block = block
    end

    def reset
      self.adapter = DEFAULT_ADAPTER
      self.username = nil
      self.password = nil
      self.user_agent = DEFAULT_USER_AGENT
    end
  end
end