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

  describe '(validations)' do
    it 'should be valid when all fields are populated' do
      entry = Entry.new('topic' => 't1', 'first' => 'f1', 'second' => 's1', 'source' => 's1', 'link' => 'l1')

      entry.valid?.should be_true
    end

    it 'should only fail valiation for topic, first and second fields' do
      invalid_entry = Entry.new()

      invalid_entry.valid?.should be_false
    end
  end
end
