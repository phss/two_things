require 'spec_helper'

describe "Entry Model" do
  let(:minimum_fields) { { 'topic' => 'some topic', 'first' => 'first thing', 'second' => 'second thing' } }
  let(:all_fields) {  minimum_fields.merge('created_by' => 'creator', 'source' => 'http://source') }

  it 'defaults creation date to now when not supplied' do
    now = Time.now
    Time.stubs(:now).returns(now)

    entry = Entry.new(minimum_fields)

    entry.created_at.should == now
  end

  describe '(attribute accessing)' do
    it 'provides accessor methods to attributes' do
      creation_date = Time.now
      entry = Entry.new(all_fields.merge('created_at' => creation_date))

      entry.topic.should == all_fields['topic']
      entry.first.should == all_fields['first']
      entry.second.should == all_fields['second']
      entry.created_by.should == all_fields['created_by']
      entry.source.should == all_fields['source']
      entry.created_at.should == creation_date
    end
  end

  describe '(persistence - integration)' do
    before { Entry.collection.remove() }

    it 'should insert a valid entry from params' do
      new_entry = Entry.insert_from(minimum_fields)
      
      new_entry.valid?.should be_true
      new_entry.is_new?.should be_false
    end
    
    it 'should not insert an invalid entry from params' do
      invalid_params = minimum_fields
      invalid_params.delete('topic')

      new_entry = Entry.insert_from(invalid_params)
      
      new_entry.valid?.should be_false
      new_entry.is_new?.should be_true
    end    

    it 'finds all entries ordered by creation time' do
      first = Entry.insert_from(minimum_fields.merge('topic' => 'first', 'created_at' => Chronic.parse('2012-01-01')))
      third = Entry.insert_from(minimum_fields.merge('topic' => 'third', 'created_at' => Chronic.parse('2012-01-03')))
      second = Entry.insert_from(minimum_fields.merge('topic' => 'second', 'created_at' => Chronic.parse('2012-01-02')))

      Entry.all_ordered_by_creation.to_a.should == [first, second, third]
    end
  end

  describe '(validations)' do
    it 'should be valid when all fields are populated' do
      Entry.new(all_fields).valid?.should be_true
    end

    it 'should be valid when minimum fields are populated' do
      Entry.new(minimum_fields).valid?.should be_true
    end

    it 'should require topic, first and second fields to be populated' do
      invalid_entry = Entry.new()

      invalid_entry.valid?.should be_false
      invalid_entry.errors.full_messages.should =~ ['Topic cannot be blank', 'First thing cannot be blank', 'Second thing cannot be blank']
    end
  end
end
