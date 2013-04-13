require 'spec_helper'

describe Ivapi::Client::Account do

  before do
    @client = Ivapi::Client.new(username: 'foo', password: 'bar')
  end

  it "returns account information" do
    stub_command("account_info").to_return(json_response("account_info.json"))
    account_info = @client.account_info
    expect(account_info.ac_name).to eq("Name Surname")
  end

  it "returns account orders" do
    stub_command("account_orders").to_return(json_response("account_orders.json"))
    account_orders = @client.account_orders
    expect(account_orders.count).to eq(3)
    expect(account_orders.first.or_cost).to eq("11.11")
  end

  it "returns account services" do
    stub_command("account_services").to_return(json_response("account_services.json"))
    account_services = @client.account_services
    expect(account_services.count).to eq(3)
    expect(account_services.first.se_description).to eq("Adreso metinis mokestis (example.com)")
  end

  it "returns account bonuses" do
    stub_command("account_bonuses", {count: 10}).to_return(json_response("account_bonuses.json"))
    account_bonuses = @client.account_bonuses
    expect(account_bonuses[2].bo_description).to eq("SMS +370.61234569 (example)")
  end
end