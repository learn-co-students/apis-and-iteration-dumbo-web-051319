require_relative 'api_communicator.rb'


def welcome
  puts "Hello, here's a Star War game"
end

def get_character_from_user
  puts "please enter a character name"
  user_input = gets.downcase.chomp
  # puts user_input
  return user_input
  # use gets to capture the user's input. This method should return that input, downcased.
end
