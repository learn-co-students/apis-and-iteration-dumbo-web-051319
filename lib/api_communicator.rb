require 'rest-client'
require 'json'
require 'pry'

def get_character_hash
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character_name)
  #make the web request
  char_info = get_character_hash
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`

  char_info["results"].each do |character_hash|
    if character_name == character_hash["name"].downcase
      return character_hash["films"]
    end
  end

  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each do |film|
    response_string = RestClient.get(film)
    response_hash = JSON.parse(response_string)
    puts response_hash["title"]
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
#show_character_movies("Luke Skywalker")

#binding.pry
