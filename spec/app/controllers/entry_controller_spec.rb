require 'spec_helper'
require 'hack_to_add_assigned_variables_and_template_to_last_response'

describe 'EntryController' do
  
  describe '(GET list)' do
    it 'should return all existing entries' do
      existing_entries = [Entry.new('_id' => 1), Entry.new('_id' => 2)]

      Entry.expects(:find).returns(existing_entries)

      get '/'

      last_response.template.should == '/list'
      last_response.assigns(:entries).to_a.should == existing_entries
    end
  end

  describe '(POST submit)' do
    it 'should create a new entry and redirect to listing entries' do
      entry_params = { 'topic' => 'a', 'first' => 'b', 'second' => 'c' }

      Entry.expects(:insert_from).with(entry_params).returns(entry_is_valid(true))

      post '/entry/submit', :entry => entry_params

      last_response.should be_redirect
    end

    it 'should re-render submit page when entry validation fails' do
      entry_params = { 'topic' => 'rest is missing' }
      invalid_entry = entry_is_valid(false)

      Entry.expects(:insert_from).with(entry_params).returns(invalid_entry)
      
      post '/entry/submit', :entry => entry_params

      last_response.template.should == '/submit'
      last_response.assigns(:entry).should == invalid_entry
    end

    def entry_is_valid(valid)
      entry = mock()
      entry.expects(:valid?).returns(valid) 
      return entry
    end
  end
end
