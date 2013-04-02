require 'ivapi/authentication'
require 'ivapi/connection'
require 'ivapi/request'

require 'ivapi/client/account'

module Ivapi
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options={})
      options = Ivapi.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
       send("#{key}=", options[key])
      end
    end

    include Ivapi::Authentication
    include Ivapi::Connection
    include Ivapi::Request

    include Ivapi::Client::Account

  end
end