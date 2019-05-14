require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  api_characters = response_hash["results"]

  film_urls = []

  api_characters.each do |character|
    if character_name == character["name"]
      film_urls = character["films"]
    end
    film_urls
  end
  url_to_info(film_urls)
end

def url_to_info(urls)
  films = []

  urls.each do |url|
  film_url_string = RestClient.get(url)
  films << film_url_hash = JSON.parse(film_url_string)
    end
  films
end
# films = []
#
# film_urls.each do |url|
# film_url_string = RestClient.get(url)
# films << film_url_hash = JSON.parse(film_url_string)
#
# end
# films

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
    # binding.pry

    puts ""
    puts "movie title:"
    puts film["title"]
  end
# binding.pry
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
