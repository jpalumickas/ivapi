require "ivapi/version"
require "httparty"
require "ivapi/railtie" if defined?(Rails)

# Iv.lt returing invalid error status, so we don't want to see it while they don't fix it.
module HTTParty
  class Parser
    protected
    def json
      if MultiJson.respond_to?(:adapter)
        MultiJson.load(body) rescue {}
      else
        MultiJson.decode(body) rescue {}
      end
    end
  end
end

module Ivapi
  autoload :Account, 	'ivapi/account'
  autoload :Server, 	'ivapi/server'
  
  def self.config=(hash)
    @@config = hash
  end

  def self.config
    raise 'Set Ivapi config before connecting.' unless defined?(@@config)
    @@config
  end
  
  def self.setup(config)
    self.config = config
  end
end
