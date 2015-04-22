require 'spec_helper'

describe Ivapi::Client do
  after(:each) do
    Ivapi.reset!
  end

  it 'works with basic auth and password' do
    expect { Ivapi::Client.new(username: 'foo', password: 'bar') }
      .not_to raise_exception
  end

  describe 'authentication' do
    it 'should possible to authenticate with configure' do
      Ivapi.configure do |config|
        config.username = 'foo'
        config.password = 'bar'
      end

      expect(Ivapi.client).to be_authenticated
    end

    it 'should possible to authenticate with basic username and password' do
      client = Ivapi::Client.new(username: 'foo', password: 'bar')
      expect(client).to be_authenticated
    end

    it 'should not possible to authenticate without username and password' do
      client = Ivapi::Client.new
      expect(client).to_not be_authenticated
    end
  end

  describe 'setting server id from client' do
    it 'should not have server id' do
      client = Ivapi::Client.new(username: 'foo', password: 'bar')
      expect(client.server_id).to be_nil
    end

    it 'should have server id when set manualy' do
      client = Ivapi::Client.new(username: 'foo', password: 'bar', server_id: 3)
      expect(client.server_id).to eq(3)
    end
  end

  describe 'manualy setting server id' do
    before(:each) do
      Ivapi.configure do |config|
        config.username = 'foo'
        config.password = 'bar'
      end
    end

    it 'should not have server id' do
      expect(Ivapi.server_id).to be_nil
    end

    it 'should have server id when set manualy' do
      expect(Ivapi.server(3).server_id).to eq(3)
    end
  end
end
