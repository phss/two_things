class Entry < Mongomatic::Base
  include Mongomatic::Expectations::Helper

  def validate
    expectations do
      be_present self['topic'], 'topic cannot be blank'
      be_present self['first'], 'first cannot be blank'
      be_present self['second'], 'second cannot be blank'
      be_present self['source'], 'source cannot be blank'
      be_present self['link'], 'link cannot be blank'      
    end
  end

end
