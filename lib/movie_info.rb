require 'rest-client'
require 'json'
require 'pry'


require_relative "./movie_info/version"
module MovieInfo

end
#this order matters, has to be afer module
require_relative "./movie_info/api"
require_relative "./movie_info/cli"
