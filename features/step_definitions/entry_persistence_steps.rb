Given /^the existing entries$/ do |table|
  Entry.collection.remove()
  table.hashes.each do |data| 
    data['created_at'] = Chronic.parse(data['created_at']) if data.has_key?('created_at')
    Entry.new(data).insert 
  end
end

Given /^no saved entries$/ do
  Entry.collection.remove()
end