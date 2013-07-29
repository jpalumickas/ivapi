module Ivapi
  module Request
    def get(path, options={})
      request(:get, path, options).body
    end

    def request(method, path, options={})

      conn_options = {
        url: "https://api.iv.lt"
      }

      options.merge!(authentication)

      response = connection(conn_options).send(method) do |request|
        request.url(path, options)
      end

      response
    end
  end
end
