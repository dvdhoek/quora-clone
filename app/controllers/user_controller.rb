# When the Sign up form is submitted, new user is created. Password is stored as a hash trough #password. 
require 'sinatra/flash'

post '/signup' do
	@user = User.new(username: params[:username], password: params[:password], email: params[:email], first_name: params[:first_name], last_name: params[:last_name])
		@user.password
		@user.save
		if @user.save
			flash[:notice] = "success"
				erb :"static/index"
		else
			flash[:alert] = "error"
				erb :"static/index"
		end
end

# Creates a new hash based on the submitted password in the login. This hash is compared with the saved hash. 
post '/login' do
	@user = User.find_by_username(params[:username])
	if @user.login(params[:password]) == true
		session[:user] = true
		session[:user_id] = @user.id
		session[:user] = @user
		session[:header] = @user.first_name
		flash[:notice] = "succes"
		redirect '/question_feed'
	else 
		erb :'static/user_error'
 	end
end

# Check if session[:user] is true 
helpers do
  def user?
    session[:user]
  end
end

# User home not accessible without session[:user] == true
get '/user_home' do
	halt(401, 'Not Authorized') unless user? 
		@questions = Question.all
		erb :'static/user_home'
		
end

get '/logout' do
	session[:user] = false
	session[:header] = "Welcome"
	erb :'static/index'
end

post '/feed' do
	@questions = Question.all
	erb :'static/question_feed'
end

# get '/signup' do
# 	erb :"static/user_signup"
# end		## redundant. 
# move to question 



