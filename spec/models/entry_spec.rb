require 'spec_helper'

describe "Entry Model" do
  it 'provides accessor methods to attributes' do
    entry = Entry.new('topic' => 't1', 'first' => 'f1', 'second' => 's1', 'source' => 's1', 'link' => 'l1')

    entry.topic.should == 't1'
    entry.first.should == 'f1'
    entry.second.should == 's1'
    entry.source.should == 's1'
    entry.link.should == 'l1'
  end

  describe '(persistence insertion)' do
    it 'should insert a valid entry from params' do
      valid_params = { 'topic' => 'some topic', 'first' => 'first thing', 'second' => 'second thing' }

      new_entry = Entry.insert_from(valid_params)
      
      new_entry.valid?.should be_true
      new_entry.is_new?.should be_false
    end
    
    it 'should not insert an invalid entry from params' do
      invalid_params = { 'topic' => 'invalid entry', 'first' => 'has only one thing' }

      new_entry = Entry.insert_from(invalid_params)
      
      new_entry.valid?.should be_false
      new_entry.is_new?.should be_true
    end    
  end

  describe '(validations)' do
    it 'should be valid when all fields are populated' do
      entry = Entry.new('topic' => 't1', 'first' => 'f1', 'second' => 's1', 'source' => 's1', 'link' => 'l1')

      entry.valid?.should be_true
    end

    it 'should require topic, first and second fields to be populated' do
      invalid_entry = Entry.new()

      invalid_entry.valid?.should be_false
      invalid_entry.errors.full_messages.should =~ ['Topic cannot be blank', 'First thing cannot be blank', 'Second thing cannot be blank']
    end
  end
end
