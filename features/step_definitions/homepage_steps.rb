Given /^I visit the home page$/ do
  visit "/"
end

Then /^I should see displayed the following entries$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end