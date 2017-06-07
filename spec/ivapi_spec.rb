require 'spec_helper'

describe Ivapi do
  it 'responds to config' do
    expect(Ivapi.respond_to?(:account)).to be_truthy
  end
end
