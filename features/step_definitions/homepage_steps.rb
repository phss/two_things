When /^I visit the home page$/ do
  visit "/"
end

When /^I submit a new entry with$/ do |table|
  entry = table.hashes.first

  click_link "Submit"
  entry.each { |name, value| fill_in "entry_#{name}", :with => value }
  click_button "Save"
end

Then /^I should see displayed the following entries$/ do |table|
  table.hashes.each_with_index do |entry, i| 
    entry_node = find("#entry_#{i}")
    entry.each { |attribute, value| entry_node.find(".#{attribute}").should have_content(value) }
  end
end

Then /^I should see following validation errors$/ do |table|
  table.rows.flatten.each do |error|
    find('.errors').should have_content(error)
  end
end
