require 'pry'
require './lib/api_communicator.rb'

def welcome
  # puts out a welcome message here!
  puts "Welcome to the end of the universe!"
end

def get_character_from_user
  puts "please enter a character name: "
  # use gets to capture the user's input. This method should return that input, downcased.
  user_input = gets.downcase!.chomp
  # binding.pry
  # input = input.downcase!
end

def runner
welcome
char = get_character_from_user
# binding.pry
show_character_movies(char)
# binding.pry
end

runner
