require 'spec_helper'

describe Ivapi::Client do

  it 'works with basic auth and password' do
    url = 'https://api.iv.lt/json.php?nick=foo&password=bar&command=version'

    stub_request(:get, url)
      .to_return(status: 200, body: '{"commits":[]}', headers: {})

    expect { Ivapi::Client.new(username: 'foo', password: 'bar') }
      .not_to raise_exception
  end

  describe 'authentication' do
    it 'is authenticated with username and password' do
      client = Ivapi::Client.new(username: 'foo', password: 'bar')
      expect(client).to be_authenticated
    end

    it 'is not authenticated without username and password' do
      client = Ivapi::Client.new
      expect(client).to_not be_authenticated
    end
  end

end
