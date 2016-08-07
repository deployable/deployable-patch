require 'spec_helper'
require 'deployable/patch/hash/accept'

describe 'Hash accept' do
  before :each do
    @hash = { :one => 1, :two => 2 }
  end

  it "hash accept" do
    expect( @hash.accept :one ).to eq({:one => 1})
  end

  it "hash accept!" do
    expect( @hash.accept! :one ).to eq({:one => 1})
    expect( @hash.accept! :one ).to be @hash
  end

end
