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
end