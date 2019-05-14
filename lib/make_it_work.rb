require 'pry'

require_relative "api_communicator.rb"
require_relative "command_line_interface.rb"



def tells_user_the_info
  welcome
  character_name = get_character_from_user
  # binding.pry
  films = get_character_movies_from_api(character_name)
  print_movies(films)
end
#
# binding.pry
#
 tells_user_the_info
