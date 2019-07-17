require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  ary = []
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  filmes = response_hash["results"]
  # return value of this method should be collection of info about each film.
  filmes.each do |ele|
    if ele["name"] == character_name
      ary = ele["films"]
    end
  end
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  return ary
end

def get_movie_director_from_api(movie_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/films/')
  response_hash = JSON.parse(response_string)
  str = ""
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  filmes = response_hash["results"]
  # return value of this method should be collection of info about each film.
  filmes.each do |ele|
    if ele["title"] == movie_name
      str = ele["director"]
    end
  end
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  return str
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list

  films.each do |ele|
    response_string = RestClient.get(ele)
    response_hash = JSON.parse(response_string)
    puts response_hash["title"]
    puts response_hash["director"]
    puts ""
  end
end

def print_director(director)
  # some iteration magic and puts out the movies in a nice list

  puts director
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

def show_movie_director(movie)
  director = get_movie_director_from_api(movie)
  print_director(director)
end
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
