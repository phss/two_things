Given /^I visit the home page$/ do
  visit "/"
end

Then /^I should see displayed the following entries$/ do |table|
  table.hashes.each_with_index do |entry, i| 
    entry_node = find("#entry_#{i}")
    entry.each { |attribute, value| entry_node.find(".#{attribute}").should have_text(value) }
  end
end