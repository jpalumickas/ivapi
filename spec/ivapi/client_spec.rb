require 'spec_helper'

describe Ivapi::Client do

  it "works with basic auth and password" do
    stub_request(:get, "https://api.iv.lt/json.php?nick=foo&password=bar&command=version").
      to_return(:status => 200, :body => '{"commits":[]}', :headers => {})
    expect {
      Ivapi::Client.new(:username => 'foo', :password => 'bar')
    }.not_to raise_exception
  end

end