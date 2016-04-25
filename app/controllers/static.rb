require_relative '../models/user'
require 'rubygems'
require 'sinatra'

enable :sessions

get '/' do
  erb :"static/index"
end

post '/signup' do
	@user = User.create(username: params[:username], password: params[:password], email: params[:email], first_name: params[:first_name], last_name: params[:last_name])
		@user.password
			@user.save
				erb :"static/user_home"
end

post '/login' do
	@user = User.find_by_username(params[:username])
	if @user.login(params[:password]) == true
		session[:user] = true
			erb :'static/user_home'
	else 
		erb :'static/user_error'
 	end
end

get '/signup' do
	erb :"static/user_signup"
end

helpers do
  def user?
    session[:user]
  end
end

get '/user_home' do
	halt(401, 'Not Authorized') unless user? 
		erb :'static/user_home'
end

post '/logout' do
	session[:user] = false
		"Logout succesful"
end


