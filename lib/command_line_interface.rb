require_relative "api_communicator"
require 'pry' 

def welcome
  puts "Welcome"
end

def get_character_from_user
  puts "please enter a character name"
  character_input = gets.chomp.to_s 
   character_input
  # use gets to capture the user's input. This method should return that input, downcased.
end
  
welcome
char = get_character_from_user 
show_character_movies(char)
 

