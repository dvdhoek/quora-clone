require 'sinatra/flash'

post '/add_question' do
	@question = Question.new(question: params[:question], details: params[:details], user_id: session[:user_id])
	@question.save
	erb	:'static/user_home'
end

get '/question_feed' do
		@questions = Question.all 
		erb :'static/question_feed'
end

get'/question_feed_unanswered' do
		@questions = Question.all
		erb :"static/question_feed_unanswered"
end

get '/question*' do 
	@questions = Question.find_by(id: params[:splat])
	session[:question_id] = @question.id
	erb :'static/question_current'
end

post '/answer' do
	@answer = Answer.new(answer: params[:answer], question_id: session[:question_id], user_id: session[:user_id])
	@answer.save
	erb :'static/user_home'
end

get '/unanswered' do
	@questions = Question.all
	erb :"static/question_feed_unanswered"
end

post '/add_answer/:question_id' do
	@question = Question.find(params[:question_id])
	@answer = Answer.new(answer: params[:answer], question_id: @question.id, user_id: session[:user_id])
	@answer.save
	erb :"static/user_home"
end

post '/upvote_answer/:answer_id' do
	byebug
	@answer = Answer.find(params[:answer_id])
	@answer.upvotes_answer += 1
	@answer.save
	erb :"static/user_home"
end