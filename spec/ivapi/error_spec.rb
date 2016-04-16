require 'spec_helper'
describe Ivapi::Error do
  describe '.from_response' do
    it 'has bad request error raised when status is 400' do
      response = { status: 400 }
      expect { raise Ivapi::Error.from_response(response) }
        .to raise_error(Ivapi::BadRequest)
    end

    it 'has unauthorized error raised when status is 401' do
      response = { status: 401 }
      expect { raise Ivapi::Error.from_response(response) }
        .to raise_error(Ivapi::Unauthorized)
    end

    it 'has forbidden error raised when status is 403' do
      response = { status: 403 }
      expect { raise Ivapi::Error.from_response(response) }
        .to raise_error(Ivapi::Forbidden)
    end
  end
end
