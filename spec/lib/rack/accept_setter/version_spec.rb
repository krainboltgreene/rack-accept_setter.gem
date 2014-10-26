require "spec_helper"

describe Rack::AcceptSetter::VERSION do
  it "should be a string" do
    expect(Rack::AcceptSetter::VERSION).to be_kind_of(String)
  end
end
