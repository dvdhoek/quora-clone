require_relative '../models/user'
require 'rubygems'

enable :sessions
enable :flash


get '/' do
	if session[:user]
		@questions = Question.all
			erb :"static/question_feed"		
	else
	session[:header] = "Welcome"
  	erb :"static/index"
	end
end



