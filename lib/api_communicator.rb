require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  film_array= []
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  puts "hello i am the first method"

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  people = response_hash["results"]
  people.each do |person|
    if person["name"] == character_name
      all_films = person["films"]
      all_films.each do |film|
      film_string = RestClient.get(film)
      film_response = JSON.parse(film_string)
      film_array << film_response
     # binding.pry
     end
    end
  end
  # puts film_array
  film_array
  # binding.pry
end

# films = get_character_movies_from_api("Darth Vader")

def print_movies(films)
  films.each_with_index do |film, index|
    # binding.pry
    puts "#{index+1}: #{film["title"]}"
  # some iteration magic and puts out the movies in a nice list
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

# print_movies(films)
  # get_character_movies_from_api("Darth Vader")
    # show_character_movies("Darth Vader")
 # binding.pry
## BONUS
# get_character_movies_from_api("Luke Skywalker")


# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
