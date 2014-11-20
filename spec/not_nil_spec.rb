require 'spec_helper'
require 'deployable/patch/not_nil'


describe 'Object not_nil ' do

  it "string" do
    expect( "test".not_nil? ).to  be true
  end

  it "nil" do
    expect( nil.not_nil? ).to  be false
  end

end