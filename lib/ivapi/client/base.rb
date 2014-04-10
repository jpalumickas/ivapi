module Ivapi
  class Client
    class Base
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def get(path, options = {})
        request(:get, path, options).body
      end

      private

      def request(method, path, options = {})
        options.merge!(client.authentication)

        response = connection.send(method) do |request|
          request.url(path, options)
        end

        response
      end

      def connection(options = {})
        conn_opts = client.connection_options
        conn_opts[:url] = client.api_endpoint
        conn_opts[:builder] = client.middleware if client.middleware

        Faraday.new(conn_opts)
      end

    end
  end
end
