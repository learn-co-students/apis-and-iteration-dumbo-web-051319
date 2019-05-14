require 'rest-client'
require 'json'
require 'pry'

def make_web_request(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character_name)
  #make the web request
  make_web_request('http://www.swapi.co/api/people/')
  #retrieve an array of character hashes
  characters_array = response_hash["results"]
  #finds specific character's hash and returns array of film urls
  film_urls_array = character_name_to_film_urls(characters_array,character_name)
  #makes web request for each url and returns array of movie info hashes
  url_to_info(film_urls_array)
end

#
def url_to_info(urls)
  films = []
  urls.each do |url|
  films << response_hash = make_web_request(url)
    end
  films
end

def character_name_to_film_urls(characters_array,character_name)
  correct_character = characters_array.find { |character| character["name"] == character_name }
  correct_character["films"]
end

  # iterate over the response hash to find the collection of `films` for the given `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.





def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each do |film|
    puts ""
    puts "movie title:"
    puts film["title"]
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
