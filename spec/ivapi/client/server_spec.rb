require 'spec_helper'

describe Ivapi::Client::Server do

  before do
    @client = Ivapi::Client.new(username: 'foo', password: 'bar', server_id: 3)
  end

  it "returns server information" do
    stub_command("server_info", {id: 3}).to_return(json_response("server_info.json"))
    server_info = @client.server_info
    expect(server_info.se_domain).to eq("server.example.com")
    expect(server_info.se_info.in_node).to eq("Robinija")
  end

end