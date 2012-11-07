require "ivapi/version"
require "httparty"

module Ivapi
	include HTTParty
	base_uri 'https://api.iv.lt/json.php'
	
	def initialize(u, p)
		self.class.default_params :nick => u
		self.class.default_params :password => p
    end
	
end
