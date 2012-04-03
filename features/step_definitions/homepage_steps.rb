When /^I visit the home page$/ do
  visit "/"
end

When /^I submit a new entry with$/ do |table|
  entry = table.hashes.first

  click_link "Submit"
  entry.each_with_index { |name, value| fill_in name, :with => value }
  click_link "Save"
end

Then /^I should see displayed the following entries$/ do |table|
  table.hashes.each_with_index do |entry, i| 
    entry_node = find(".entry_#{i}")
    entry.each { |attribute, value| entry_node.find("##{attribute}").should have_content(value) }
  end
end

