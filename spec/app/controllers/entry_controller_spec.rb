require 'spec_helper'
require 'hack_to_add_assigned_variables_and_template_to_last_response'

describe 'EntryController' do
  before do
    Entry.collection.remove
  end

  describe '(GET list)' do
    it 'should return all existing entries' do
      entry1 = saved_entry('topic' => 't1', 'first' => 'f1', 'second' => 's1', 'source' => 's1', 'link' => 'l1')
      entry2 = saved_entry('topic' => 't2', 'first' => 'f2', 'second' => 's2', 'source' => 's2', 'link' => 'l2')

      get '/'

      last_response.template.should == '/list'
      last_response.assigns(:entries).to_a.should == [entry1, entry2]
    end
  end

  describe '(POST submit)' do
    it 'should create a new entry and redirect to listing entries' do
      entry_params = { :topic => 'a', :first => 'b', :second => 'c' }
      post '/entry/submit', :entry => entry_params

      last_response.should be_redirect
      Entry.find.first.should match_params(entry_params)
    end
  end

  RSpec::Matchers.define :match_params do |expected|
    match do |actual|
      expected.each do |attribute, expected_value|
        return false unless actual[attribute.to_s] == expected_value
      end
      true
    end
  end

  def saved_entry(data)
    entry = Entry.new(data)
    entry.insert
    return entry
  end
end
