Given /^the following saved entries$/ do |table|
  Mongomatic.db.collection("entries").remove()
  table.hashes.each { |image| Mongomatic.db.collection("entries").save(image) }
end