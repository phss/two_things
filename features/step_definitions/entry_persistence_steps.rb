Given /^the existing entries$/ do |table|
  Entry.collection.remove()
  table.hashes.each do |data| 
    data['created_at'] = DateTime.parse(data['created_at']).to_time if data.has_key?('created_at')
    Entry.new(data).insert 
  end
end

Given /^no saved entries$/ do
  Entry.collection.remove()
end