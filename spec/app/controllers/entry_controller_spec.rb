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
      post '/entry/submit', :entry => { :topic => 'a', :first => 'b', :second => 'c' }

      puts last_response.methods
      
      Entry.find.first.topic.should == 'a'
    end
  end

  def saved_entry(data)
    entry = Entry.new(data)
    entry.insert
    return entry
  end
end
