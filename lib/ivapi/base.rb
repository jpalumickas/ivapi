require 'ivapi/account'

module Ivapi
  class Base

    include HTTParty
    base_uri 'https://api.iv.lt'
    format :json

    attr_reader :auth, :file

    def initialize(u, p)
      @auth = {:nick => u, :password => p }
      @file = '/json.php'
    end

    def version
      options = { :command => 'version' }
      self.class.get(self.file, :query => options.merge!(@auth))['version']
    end

    include Account

  end
end
