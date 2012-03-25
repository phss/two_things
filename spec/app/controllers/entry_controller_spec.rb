require 'spec_helper'
require 'hack_to_add_assigned_variables_and_template_to_last_response'

describe "EntryController" do
  it "should return all existing entries" do
    get "/"

    last_response.template.should == "/list"
  end
end
