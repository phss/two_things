require 'spec_helper'

describe "EntryController" do
  before do
    get "/"
  end

  it "returns hello world" do
    pending
    last_response.body.should == "Hello World"
  end
end
