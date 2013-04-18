require 'ivapi/configuration'
require 'ivapi/error'
require 'ivapi/client'

module Ivapi
  extend Configuration

  class << self

    def new(options={})
        Ivapi::Client.new(options)
    end

  end
end
