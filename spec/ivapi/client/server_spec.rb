require 'spec_helper'

describe Ivapi::Client::Server do
  before(:each) do
    Ivapi.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
      config.server_id = 3
    end
  end

  after(:each) do
    Ivapi.reset!
  end

  describe 'server information' do
    before(:each) do
      stub_command('server_info', id: 3)
        .to_return(json_response('server_info.json'))
      @info = Ivapi.server.information
    end

    it 'should response with alias method' do
      expect(Ivapi.server.info.domain).to eq('server.example.com')
    end

    it 'should return domain name' do
      expect(@info.domain).to eq('server.example.com')
    end

    it 'should return node name' do
      expect(@info.info.node).to eq('Robinija')
    end
  end

  describe 'server tasks' do
    before(:each) do
      stub_command('server_tasks', id: 3, count: 1)
        .to_return(json_response('server_tasks.json'))
      @tasks = Ivapi.server.tasks(1)
      @task = @tasks.first
    end

    it 'should return params domain name' do
      expect(@task.params.domain).to eq('server.example.com')
    end
  end

  describe 'server graphs' do
    before(:each) do
      stub_command('server_graphs', id: 3, width: 1000, ip: '12.23.34.45')
        .to_return(json_response('server_graphs.json'))
      @graphs = Ivapi.server.graphs(1000, '12.23.34.45')
    end

    it 'should return cpu weekly' do
      expect(@graphs.cpu_weekly).to eq('//stats.serveriai.lt/graph.php?Ds252x+6Lek1o0SV2+u99fqhNaiflbCcb6QuGzlRJ9yy2R1VycHOc6baz3zRB6Am1RJcniVrpCjj+A47DMwkyfQ==')
    end
  end

  it 'should return server tasks with specified options' do
    stub_command('server_tasks', id: 3, count: 1, task_id: 1)
      .to_return(json_response('server_tasks.json'))
    server_tasks = Ivapi.client.server(3).tasks(1, { task_id: 1 })
    expect(server_tasks.first.params.domain).to eq('server.example.com')
  end

  describe 'server os' do
    before(:each) do
      stub_command('server_os', id: 3)
        .to_return(json_response('server_os.json'))
      @os = Ivapi.server.os['debian-6.0-x86_64']
    end

    it 'should return cpu weekly' do
      expect(@os.title).to eq('Debian 6')
    end
  end

  describe 'server reboot' do
    before(:each) do
      stub_command('server_reboot', id: 3)
        .to_return(json_response('server_reboot.json'))
      @reboot_response = Ivapi.server.reboot
    end

    it 'should return task id' do
      expect(@reboot_response.task_id).to eq('11')
    end
  end

  describe 'server recreate server' do
    before(:each) do
      stub_command('server_recreate', id: 3, os: 'debian-6.0-x86_64')
       .to_return(json_response('server_recreate.json'))
      @recreate_response = Ivapi.server.recreate('debian-6.0-x86_64')
    end

    it 'should return task id' do
      expect(@recreate_response.task_id).to eq('12')
    end
  end

  describe 'reset server password' do
    before(:each) do
      stub_command('server_reset_password', id: 3)
        .to_return(json_response('server_reset_password.json'))
      @reset_pwd_response = Ivapi.server.reset_password
    end

    it 'should return task id' do
      expect(@reset_pwd_response.task_id).to eq('13')
    end
  end

  describe 'flush server iptables' do
    before(:each) do
      stub_command('server_flush_iptables', id: 3)
        .to_return(json_response('server_flush_iptables.json'))
      @flush_response = Ivapi.server.flush_iptables
    end

    it 'should return task id' do
      expect(@flush_response.task_id).to eq('16')
    end
  end

  describe 'change server firewall settings' do
    before(:each) do
      stub_command('server_firewall', id: 3)
        .to_return(json_response('server_firewall.json'))
      @firewall = Ivapi.server.firewall
    end

    it 'should return correct pps' do
      expect(@firewall.pps).to eq('1000')
    end
  end

  describe 'change server plan' do
    before(:each) do
      stub_command('server_change', id: 3)
        .to_return(json_response('server_change.json'))
      @plan_response = Ivapi.server.change
    end

    it 'should return correct pps' do
      expect(@plan_response.task_id).to eq('14')
    end
  end

  describe 'change server hostname' do
    before(:each) do
      stub_command('server_domain', id: 3, domain: 'example.com')
        .to_return(json_response('server_domain.json'))
      @hostname_response = Ivapi.server.domain('example.com')
    end

    it 'should return task id' do
      expect(@hostname_response.task_id).to eq('15')
    end

    it 'should response with alias method' do
      expect(Ivapi.server.hostname('example.com').task_id).to eq('15')
    end
  end
end
