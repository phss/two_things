Given /^the following saved entries$/ do |table|
  Entry.collection.remove()
  table.hashes.each { |data| Entry.new(data).insert }
end

Given /^no saved entries$/ do
  Entry.collection.remove()
end