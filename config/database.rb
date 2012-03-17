
case Padrino.env
  when :development then Mongomatic.db = Mongo::Connection.new.db("two_things_development")
  when :production then Mongomatic.db = Mongo::Connection.new.db("two_things_production")
  when :test then Mongomatic.db = Mongo::Connection.new.db("two_things_test")
end
