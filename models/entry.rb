class Entry < Mongomatic::Base
  include Mongomatic::Expectations::Helper

  %w{topic first second source link}.each do |attribute|
    define_method attribute do
      self[attribute]
    end
  end

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
