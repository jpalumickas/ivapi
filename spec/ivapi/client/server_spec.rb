require 'spec_helper'

describe Ivapi::Client::Server do

  before do
    @client = Ivapi::Client.new(username: 'foo', password: 'bar', server_id: 3)
  end

  it "should return server information" do
    stub_command("server_info", {id: 3}).to_return(json_response("server_info.json"))
    server_info = @client.server_info
    expect(server_info.se_domain).to eq("server.example.com")
    expect(server_info.se_info.in_node).to eq("Robinija")
  end

  it "should return server graphs" do
    stub_command("server_graphs", {id: 3, width: 1000, ip: "12.23.34.45"}).to_return(json_response("server_graphs.json"))
    server_graphs = @client.server_graphs(1000, "12.23.34.45")
    expect(server_graphs.cpu_weekly).to eq("//stats.serveriai.lt/graph.php?Ds252x+6Lek1o0SV2+u99fqhNaiflbCcb6QuGzlRJ9yy2R1VycHOc6baz3zRB6Am1RJcniVrpCjj+A47DMwkyfQ==")
  end

  it "should return server os" do
    stub_command("server_os", {id: 3}).to_return(json_response("server_os.json"))
    server_os = @client.server_os
    expect(server_os["debian-6.0-x86_64"].title).to eq("Debian 6")
  end

  it "should reboot server" do
    stub_command("server_reboot", {id: 3}).to_return(json_response("server_reboot.json"))
    server_reboot = @client.server_reboot
    expect(server_reboot.task_id).to eq("11")
  end

  it "should recreate server" do
    stub_command("server_recreate", {id: 3}).to_return(json_response("server_recreate.json"))
    server_recreate = @client.server_recreate
    expect(server_recreate.task_id).to eq("12")
  end

  it "should reset server password" do
    stub_command("server_reset_password", {id: 3}).to_return(json_response("server_reset_password.json"))
    server_reset_password = @client.server_reset_password
    expect(server_reset_password.task_id).to eq("13")
  end

  it "should change server plan" do
    stub_command("server_change", {id: 3}).to_return(json_response("server_change.json"))
    server_change = @client.server_change
    expect(server_change.task_id).to eq("14")
  end

  it "should change server hostname" do
    stub_command("server_domain", {id: 3}).to_return(json_response("server_domain.json"))
    server_domain = @client.server_domain
    expect(server_domain.task_id).to eq("15")
  end

end