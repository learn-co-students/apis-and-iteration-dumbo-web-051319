# require_relative "api_communicator.rb"

def welcome
  # puts out a welcome message here!
  puts "Welcome!"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp
  show_character_movies(input)
end
