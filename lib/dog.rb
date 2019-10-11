require 'pry'
class Dog 
  
attr_accessor :id, :name, :breed 

def initialize(hash)
  hash.each 
  binding.pry
end
  
end 