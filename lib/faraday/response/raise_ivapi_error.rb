require 'faraday'
require 'multi_json'

module Faraday
  class Response::RaiseIvapiError < Response::Middleware
    ERROR_MAP = {
      400 => Ivapi::BadRequest,
      401 => Ivapi::Unauthorized,
      403 => Ivapi::Forbidden,
      404 => Ivapi::NotFound,
      406 => Ivapi::NotAcceptable,
      422 => Ivapi::UnprocessableEntity,
      500 => Ivapi::InternalServerError,
      501 => Ivapi::NotImplemented,
      502 => Ivapi::BadGateway,
      503 => Ivapi::ServiceUnavailable
    }

    def on_complete(response)
      key = response[:status].to_i
      raise ERROR_MAP[key].new(response) if ERROR_MAP.has_key? key
    end
  end
end