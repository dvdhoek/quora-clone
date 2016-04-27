require_relative '../models/user'
require 'rubygems'
require 'sinatra/flash'

enable :sessions
enable :flash
get '/' do
  erb :"static/index"
end



