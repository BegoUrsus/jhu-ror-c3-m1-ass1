require 'mongo'
require 'pp'

Mongo::Logger.logger.level = ::Logger::INFO

class Solution
  @@db = nil

  #Implement a class method in the `Solution` class called `mongo_client` that will 
  def self.mongo_client
    #create a `Mongo::Client` connection to the server using a URL (.e.g., 'mongodb://localhost:27017')
    #configure the client to use the `test` database
    #assign the client to @@db instance variable and return that client
    @@db = Mongo::Client.new('mongodb://localhost:27017')
    @@db = @@db.use('test')
    return @@db
  end

  #Implement a class method in the `Solution` class called `collection` that will
  def self.collection
    #return the `zips` collection
    col_name =  @@db.database.collection_names.first
    return @@db.database.collection(col_name)
  end

  #Implement an instance method in the `Solution` class called `sample` that will
  def sample
    #return a single document from the `zips` collection from the database. 
    #This does not have to be random. It can be first, last, or any other document in the collection.
    return @@db[:zips].find.first
  end
end

#byebug
db=Solution.mongo_client
p db
zips=Solution.collection
p zips
s=Solution.new
pp s.sample
