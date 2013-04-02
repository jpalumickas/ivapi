require 'ivapi/configuration'
require 'ivapi/error'
require 'ivapi/client'

module Ivapi
  extend Configuration

  def new(options={})
      Ivapi::Client.new(options)
  end
end
