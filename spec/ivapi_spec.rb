require 'spec_helper'

describe Ivapi do
  it 'responds to config' do
    expect(Ivapi.respond_to?(:configure)).to be_truthy
  end

  # describe '.new' do
  #   it 'is a Ivapi::Client' do
  #     expect(Ivapi.new).to be_a Ivapi::Client
  #   end
  # end
end
