require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name = "Luke Skywalker")
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/') # getting the api from web as string
  response_hash = JSON.parse(response_string) #converting the string to readable format for the user
  film_arr = []
  # iterate over the response hash to find the collection of `films` for the given
  response_hash.each do |key, value|
    # binding.pry
    if key == "results"
      value.each do |hash|
        if character_name == hash["name"]
          hash["films"].each do |url|
            film_string  = RestClient.get(url)
            film_hash = JSON.parse(film_string)
            film_arr << film_hash
           end
         end

         return film_arr

       end

     end
  end
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  #binding.pry
end

def print_movies(films)
  films.each do |hash|
    puts hash["title"]

  end
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character) #returns array of hashes , hash => movie
  print_movies(films) # returns list of movies 
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
