require 'pry'
class Dog 
  
attr_accessor :id, :name, :breed 

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    self.id ||= nil
  end
  
  def self.create_table
  sql = <<-SQL 
  CREATE TABLE IF NOT EXISTS dogs (
  id INTEGER PRIMARY KEY,
  name TEXT,
  breed TEXT)
  SQL
  DB[:conn].execute(sql)
  end
  
  def self.drop_table
    DB[:conn].execute("DROP TABLE dogs")
  end
  
  def save
  sql = <<-SQL
  INSERT INTO dogs(name, breed)
  VALUES(?, ?)
  SQL
  
  sql2 = <<-SQL 
  SELECT id FROM dogs
  SQL
  DB[:conn].execute(sql, self.name, self.breed)
  @id = DB[:conn].execute(sql2).last
  
  self
  end
    
end 