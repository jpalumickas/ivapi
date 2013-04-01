require 'ivapi/account'

module Ivapi
  class Base

    include HTTParty
    base_uri 'https://api.iv.lt'
    format :json

    attr_reader :auth, :file

    def initialize(username, password)
      @auth = {:nick => username, :password => password}
      @file = '/json.php'
    end

    def version
      options = { :command => 'version' }
      self.class.get(self.file, :query => options.merge!(@auth))['version']
    end

  end
end
