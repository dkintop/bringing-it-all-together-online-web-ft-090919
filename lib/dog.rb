require 'pry'
class Dog 
  
attr_accessor :id, :name, :breed 

def initialize(hash)
  attributes.each 
  binding.pry
end
  
end 