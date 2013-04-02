require 'faraday_middleware'
require 'faraday/response/raise_ivapi_error'

module Ivapi
  module Connection
    private

    def connection(options={})
      connection = Faraday.new(options) do |builder|

        builder.request :json

        builder.use Faraday::Response::RaiseIvapiError
        builder.use FaradayMiddleware::FollowRedirects
        builder.use FaradayMiddleware::Mashify

        builder.use FaradayMiddleware::ParseJson, :content_type => /\bjson$/

        faraday_config_block.call(builder) if faraday_config_block

        builder.adapter *adapter
      end

      connection.headers[:user_agent] = user_agent

      connection
    end
  end
end