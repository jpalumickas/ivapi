require 'spec_helper'

describe Ivapi::Client::Server do

  before(:each) do
    @client = Ivapi::Client.new(username: 'foo', password: 'bar')
    Ivapi.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
    end
  end

  after(:each) do
    Ivapi.reset!
  end

  it 'should return server information' do
    stub_command('server_info', { id: 3 })
      .to_return(json_response('server_info.json'))
    server_info = Ivapi.client.server(3).server_info
    expect(server_info.se_domain).to eq('server.example.com')
    expect(server_info.se_info.in_node).to eq('Robinija')
  end

  it 'should return server tasks' do
    stub_command('server_tasks', { id: 3, count: 1 })
      .to_return(json_response('server_tasks.json'))
    server_tasks = @client.server(3).server_tasks(1)
    expect(server_tasks.first.ta_params.domain).to eq('server.example.com')
  end

  it 'should return server tasks with specified options' do
    stub_command('server_tasks', { id: 3, count: 1, task_id: 1 })
      .to_return(json_response('server_tasks.json'))
    server_tasks = @client.server(3).server_tasks(1, { task_id: 1 })
    expect(server_tasks.first.ta_params.domain).to eq('server.example.com')
  end

  it 'should return server graphs' do
    stub_command('server_graphs', { id: 3, width: 1000, ip: '12.23.34.45' })
      .to_return(json_response('server_graphs.json'))
    server_graphs = @client.server(3).server_graphs(1000, '12.23.34.45')
    expect(server_graphs.cpu_weekly).to eq('//stats.serveriai.lt/graph.php?Ds252x+6Lek1o0SV2+u99fqhNaiflbCcb6QuGzlRJ9yy2R1VycHOc6baz3zRB6Am1RJcniVrpCjj+A47DMwkyfQ==')
  end

  it 'should return server os' do
    stub_command('server_os', { id: 3 })
      .to_return(json_response('server_os.json'))
    server_os = @client.server(3).server_os
    expect(server_os['debian-6.0-x86_64'].title).to eq('Debian 6')
  end

  it 'should reboot server' do
    stub_command('server_reboot', { id: 3 })
      .to_return(json_response('server_reboot.json'))
    server_reboot = @client.server(3).server_reboot
    expect(server_reboot.task_id).to eq('11')
  end

  it 'should recreate server' do
    stub_command('server_recreate', { id: 3, os: 'debian-6.0-x86_64' })
      .to_return(json_response('server_recreate.json'))
    server_recreate = @client.server(3).server_recreate('debian-6.0-x86_64')
    expect(server_recreate.task_id).to eq('12')
  end

  it 'should reset server password' do
    stub_command('server_reset_password', { id: 3 })
      .to_return(json_response('server_reset_password.json'))
    server_reset_password = @client.server(3).server_reset_password
    expect(server_reset_password.task_id).to eq('13')
  end

  it 'should flush server iptables' do
    stub_command('server_flush_iptables', { id: 3 })
      .to_return(json_response('server_flush_iptables.json'))
    server_flush_iptables = @client.server(3).server_flush_iptables
    expect(server_flush_iptables.task_id).to eq('16')
  end

  it 'should change server firewall settings' do
    stub_command('server_firewall', { id: 3 })
      .to_return(json_response('server_firewall.json'))
    server_firewall = @client.server(3).server_firewall
    expect(server_firewall.pps).to eq('1000')
  end

  it 'should change server plan' do
    stub_command('server_change', { id: 3 })
      .to_return(json_response('server_change.json'))
    server_change = @client.server(3).server_change
    expect(server_change.task_id).to eq('14')
  end

  it 'should change server hostname' do
    stub_command('server_domain', { id: 3, domain: 'example.com' })
      .to_return(json_response('server_domain.json'))
    server_domain = @client.server(3).server_domain('example.com')
    expect(server_domain.task_id).to eq('15')
  end

end
