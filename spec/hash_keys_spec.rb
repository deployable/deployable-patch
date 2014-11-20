require 'spec_helper'
require 'deployable/patch/hash_keys'

describe 'Hash keys any/all' do
  before :each do
    @hash = { :one => 1, :two => 2 }
  end

  it "hash any key true" do
    expect( @hash.has_any_keys? :one ).to  be true
  end

  it "hash any key multiple true" do
    expect( @hash.has_any_keys? :one, :two ).to  be true
  end

  it "hash any key false" do
    expect( @hash.has_any_keys? :three ).to  be false
  end

  it "hash all keys" do
    expect( @hash.has_all_keys? :one, :two ).to  be true
  end

  it "hash all keys false" do
    expect( @hash.has_all_keys? :three ).to  be false
  end

  it "hash all keys false" do
    expect( @hash.has_all_keys? :one, :three ).to  be false
  end

end
