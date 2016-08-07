require 'spec_helper'
require 'deployable/patch/hash/except'

describe 'Hash except' do
  before :each do
    @hash = { :one => 1, :two => 2 }
  end

  it "should return a new hash with :one" do
    expect( @hash.except :one ).to eq({:two => 2})
  end

  it "should return a new hash with nothing" do
    expect( @hash.except :one, :two ).to eq({})
  end

  it "should return same hash without :two" do
    expect( @hash.except! :one ).to eq @hash
    expect( @hash.except! :one ).to eq({:two => 2})
  end

end
