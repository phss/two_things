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
end
