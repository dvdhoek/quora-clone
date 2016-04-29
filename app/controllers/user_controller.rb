# When the Sign up form is submitted, new user is created. Password is stored as a hash trough #password. 
require 'sinatra/flash'

post '/signup' do

	@user = User.new(params[:user])
		@user.password
		@user.save
		if @user.save
			flash.now[:notice] = "Signup succesful"
				redirect '/'
		else
			flash.now[:alert] = "Please fill in all the fields"
				erb :"static/index"
		end
end

# Creates a new hash based on the submitted password in the login. This hash is compared with the saved hash. 
post '/login' do
	@user = User.find_by_username(params[:username])
	if @user == nil
		flash.now[:notice] = "Username incorrect"
		erb :'static/index'
	elsif @user.login(params[:password])
		session[:user] = @user
		session[:user_id] = @user.id
		session[:user] = @user
		session[:header] = @user.first_name
		flash.now[:notice] = "Login succesful"
		erb :'static/index'
	else 
		flash.now[:notice] = "Password incorrect"
		erb :'static/index'
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
	if user? 
		@answers = Answer.all
		@questions = Question.all
			@next_page = params[:page].to_i + 1
		erb :'static/user_home'
	else
		flash[:notice] = "Please signup or login"
		erb :'static/index'
	end
end

get '/logout' do
	session.clear
	session[:header] = "Welcome"
		erb :'static/index'
end

post '/feed' do
	@questions = Question.paginate(:page => params[:page]) 
		@next_page = params[:page].to_i + 1
		erb :'static/question_feed'
end

get '/profile/:user_id' do
	@questions = Question.paginate(:page => params[:page])
		@next_page = params[:page].to_i + 1
		@user_profile = User.find(params[:user_id])
		@answers = Answer.all
		erb :'static/profile'
		
end




