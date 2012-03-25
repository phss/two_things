require 'spec_helper'
require 'hack_rack_test'

describe "EntryController" do
  it "should return all existing entries" do
    get "/"

    last_response.template.should == "/list"
  end
end
