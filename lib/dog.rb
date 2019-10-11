require 'pry'
class Dog 
  
attr_accessor :id, :name, :breed 

  def initialize(attributes_hash)
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
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
  @id = DB[:conn].execute(sql2).last[0]
  self
  end
  
  def self.create(attributes)
    new_dog = Dog.new(attributes)
    new_dog.save
  end 
  
  def self.new_from_db(row) 
  attributes= {
    :id => row[0],
    :name => row[1],
    :breed => row[2]
    }
    new_dog = Dog.new(attributes)
  end 
  
  def self.find_by_id(id) 
    sql = <<-SQL 
      SELECT * FROM dogs 
      WHERE id = ?
    SQL
     DB[:conn].execute(sql, id).map do |row|
      self.new_from_db(row)
    end.first
  end 
  
 
  
    
end 