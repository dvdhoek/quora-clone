require_relative '../models/user'
require 'rubygems'
require 'sinatra'

enable :sessions

get '/' do
  erb :"static/index"
end