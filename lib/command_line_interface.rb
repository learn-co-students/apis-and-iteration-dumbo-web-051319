require_relative "api_communicator.rb"

def welcome
  # puts out a welcome message here!
  puts "Hellow Welcome to Star War API!"

end
def selctor
  puts "Find director from Movie for D"
  puts "or"
  puts "Find character name from Movie for C"
  input = gets.chomp
  input.upcase!
  if input == "D"
    get_director_from_user
  elsif input == "C"
    get_character_from_user
  else
    puts "Error, wrong input"
  end
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp
  input.downcase
  show_character_movies(input)
end

def get_director_from_user
  puts "please enter a movie name"
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp
  input.downcase
  show_movie_director(input)
end
