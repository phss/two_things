class Entry < Mongomatic::Base
  include Mongomatic::Expectations::Helper

  %w{topic first second source link}.each do |attribute|
    define_method(attribute) { self[attribute] }
  end

  def validate
    expectations do
      be_present topic, 'Topic cannot be blank'
      be_present first, 'First thing cannot be blank'
      be_present second, 'Second thing cannot be blank'
    end
  end

  class << self

    def insert_from(hash)
      entry = Entry.new(hash)
      entry.insert
      return entry
    end
    
  end

end
