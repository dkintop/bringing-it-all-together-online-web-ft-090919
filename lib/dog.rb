require 'pry'
class Dog 
  
attr_accessor :id, :name, :breed 

def initialize(hash)
  hash.each do |key, value|
    binding.pry
  end 
end
  
end 