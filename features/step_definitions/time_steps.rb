Given /^today is (.*)$/ do |date|
  new_now = Chronic.parse(date)
  Time.stubs(:now).returns(new_now)
end