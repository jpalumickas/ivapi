require 'faraday_middleware'
require 'ivapi/response/raise_error'
require 'ivapi/version'

module Ivapi

  # Default configuration options for {Client}
  module Default
    # Default API endpoint
    API_ENDPOINT = "https://api.iv.lt".freeze

    # Default User Agent header string
    USER_AGENT   = "Ivapi ruby gem v#{Ivapi::VERSION}".freeze

    # In Faraday 0.9, Faraday::Builder was renamed to Faraday::RackBuilder
    RACK_BUILDER_CLASS = defined?(Faraday::RackBuilder) ? Faraday::RackBuilder : Faraday::Builder

    # Default Faraday middleware stack
    MIDDLEWARE = RACK_BUILDER_CLASS.new do |builder|
      builder.request :json
      builder.use Ivapi::Response::RaiseError
      builder.use FaradayMiddleware::FollowRedirects
      builder.use FaradayMiddleware::Mashify
      builder.use FaradayMiddleware::ParseJson
      builder.adapter Faraday.default_adapter
    end

    class << self

      # Configuration options
      # @return [Hash]
      def options
        Hash[Ivapi::Configuration.keys.map{ |key| [key, send(key)] }]
      end

       # Default GitHub username for Basic Auth from ENV
      # @return [String]
      def username
        ENV['IVAPI_USERNAME']
      end

      def server_id
        nil
      end

      # Default middleware stack for Faraday::Connection
      # from {MIDDLEWARE}
      # @return [String]
      def middleware
        MIDDLEWARE
      end

      # Default GitHub password for Basic Auth from ENV
      # @return [String]
      def password
        ENV['IVAPI_PASSWORD']
      end

      def connection_options
        {
          headers: {
            user_agent: user_agent
          }
        }
      end

      # Default User-Agent header string from ENV or {USER_AGENT}
      # @return [String]
      def user_agent
        ENV['IVAPI_USER_AGENT'] || USER_AGENT
      end

      # Default API endpoint from ENV or {API_ENDPOINT}
      # @return [String]
      def api_endpoint
        ENV['IVAPI_API_ENDPOINT'] || API_ENDPOINT
      end
    end
  end
end
