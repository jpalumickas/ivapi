# frozen_string_literal: true

require 'spec_helper'

describe Ivapi::Client::Server do
  before do
    Ivapi.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
      config.hosting_id = 1
    end
  end

  after do
    Ivapi.reset!
  end

  describe '#information' do
    let(:info) { Ivapi.hosting.information }

    before do
      stub_command('hosting_info', id: 1)
        .to_return(json_response('hosting_info.json'))
    end

    it 'has alias info method' do
      expect(Ivapi.hosting.info).to eq(info)
    end

    it 'has correct id' do
      expect(info.id).to eq('1')
    end
  end
end
