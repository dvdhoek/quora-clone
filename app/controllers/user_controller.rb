# When the Sign up form is submitted, new user is created. Password is stored as a hash trough #password. 
post '/signup' do
	@user = User.create(username: params[:username], password: params[:password], email: params[:email], first_name: params[:first_name], last_name: params[:last_name])
		@user.password
			@user.save
				erb :"static/user_home"
end

# Creates a new hash based on the submitted password in the login. This hash is compared with the saved hash. 
post '/login' do
	@user = User.find_by_username(params[:username])
	if @user.login(params[:password]) == true
		session[:user] = true
			session[:user_id] = @user.id
			session[:header] = @user.first_name
			erb :'static/user_home'
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
		erb :'static/user_home'
end

post '/logout' do
	session[:user] = false
	session[:header] = "to Quora"
		"Logout succesful"
end

post '/feed' do
	@questions = Question.all
	erb :'static/question_feed'
end

# get '/signup' do
# 	erb :"static/user_signup"
# end		## redundant. 
# move to question 



