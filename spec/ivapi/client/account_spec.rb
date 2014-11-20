require 'spec_helper'

describe Ivapi::Client::Account do
  before(:each) do
    Ivapi.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
    end
  end

  after(:each) do
    Ivapi.reset!
  end

  describe 'account information' do
    before(:each) do
      stub_command('account_info')
        .to_return(json_response('account_info.json'))
      @info = Ivapi.account.information
    end

    it 'should return account name' do
      expect(@info.name).to eq('Name Surname')
    end
  end

  describe 'account orders' do
    before(:each) do
      stub_command('account_orders')
        .to_return(json_response('account_orders.json'))
      @account_orders = Ivapi.account.orders
      @order = @account_orders.first
    end

    it 'should return correct orders count' do
      expect(@account_orders.count).to eq(3)
    end

    it 'should return order cost' do
      expect(@order.cost).to eq('11.11')
    end
  end

  describe 'account services' do
    before(:each) do
      stub_command('account_services')
        .to_return(json_response('account_services.json'))
      @account_services = Ivapi.account.services
      @service = @account_services.first
    end

    it 'should return correct services count' do
      expect(@account_services.count).to eq(3)
    end

    it 'should return service description' do
      expect(@service.description)
        .to eq('Adreso metinis mokestis (example.com)')
    end
  end

  it 'returns account credits'

  describe 'account bonuses' do
    before(:each) do
      stub_command('account_bonuses', count: 10)
        .to_return(json_response('account_bonuses.json'))
      @account_bonuses = Ivapi.account.bonuses
      @bonus = @account_bonuses[2]
    end

    it 'should return correct bonuses count' do
      expect(@account_bonuses.count).to eq(3)
    end

    it 'should return bonus description' do
      expect(@bonus.description)
        .to eq('SMS +370.61234569 (example)')
    end
  end
end
