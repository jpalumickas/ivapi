# frozen_string_literal: true

module Ivapi
  class Error < StandardError
    # Returns the appropriate Ivapi::Error sublcass based
    # on status and response message.
    #
    # response - The Hash of HTTP response.
    #
    # Returns the Ivapi::Error.
    def self.from_response(response)
      status = response[:status].to_i

      klass = case status
      when 400 then Ivapi::BadRequest
      when 401 then Ivapi::Unauthorized
      when 403 then Ivapi::Forbidden
      end

      klass&.new(response)
    end
  end

  # Raised when iv.lt returns a 400 HTTP status code
  class BadRequest < Error; end

  # Raised when iv.lt returns a 401 HTTP status code
  class Unauthorized < Error; end

  # Raised when iv.lt returns a 403 HTTP status code
  class Forbidden < Error; end
end
