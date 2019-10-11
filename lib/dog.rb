require 'pry'
class Dog 
  
attr_accessor :id, :name, :breed 

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    self.id ||= nil
  end
  
  def self.create_table
  
  sql = <<-SQL CREATE TABLE IF NOT EXISTS dogs () 
  
  end
end 