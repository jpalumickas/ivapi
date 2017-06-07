require 'ivapi/configuration'
require 'ivapi/authentication'

require 'ivapi/client/base'
require 'ivapi/client/account'
require 'ivapi/client/hosting'
require 'ivapi/client/server'

module Ivapi
  class Client
    include Ivapi::Authentication
    include Ivapi::Configuration

    attr_reader(*Ivapi::Configuration.keys)

    def initialize(options = {})
      # Use options passed in, but fall back to module defaults
      Ivapi::Configuration.keys.each do |key|
        instance_variable_set(
          :"@#{key}", options[key] || Ivapi.instance_variable_get(:"@#{key}")
        )
      end
    end

    def account
      Ivapi::Client::Account.new(self)
    end

    def hosting(hosting_id = @hosting_id)
      Ivapi::Client::Hosting.new(self, hosting_id)
    end

    def server(server_id = @server_id)
      Ivapi::Client::Server.new(self, server_id)
    end

    def same_options?(opts)
      opts.hash == options.hash
    end
  end
end
