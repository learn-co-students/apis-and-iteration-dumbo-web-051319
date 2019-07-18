require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  response_hash["results"].each do |name_hash|
    
    if character_name == name_hash["name"] 
    return name_hash["films"]
    end
  end

  
 
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

# get_character_movies_from_api("Luke Skywalker")
# binding.pry
def print_movies(films)
  list_films = [] 
  films.each do |movie|
  response_string = RestClient.get(movie)
  response_hash = JSON.parse(response_string)
   list_films << response_hash["title"]  

  end 
  puts list_films 

  # some iteration magic and puts out the movies in a nice list
end 


def show_character_movies(character_name)

  films = get_character_movies_from_api(character_name)
  print_movies(films)
end
   


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
# binding.pry