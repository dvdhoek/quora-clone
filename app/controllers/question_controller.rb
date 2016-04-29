post '/add_question' do
	@question = Question.new(question: params[:question], details: params[:details], user_id: session[:user_id])
		@question.save
			@questions = Question.all
		redirect '/user_home'
end

get '/question_feed/:page' do
		@questions = Question.paginate(:page => params[:page]) 
			@next_page = params[:page].to_i + 1
			erb :'static/question_feed'
end

get'/question_feed_unanswered/:page' do
		@question = Question.order('no_answers asc')
		@questions = @question.paginate(:page => params[:page]) 
			@next_page = params[:page].to_i + 1
			erb :"static/question_feed_unanswered"
end



post '/answer' do
	@answer = Answer.new(answer: params[:answer], question_id: session[:question_id], user_id: session[:user_id])
		@answer.save
			@questions = Question.all
		erb :'static/user_home'
end

get '/unanswered' do
		@questions = Question.paginate(:page => params[:page]) 
			@next_page = params[:page].to_i + 1
		erb :"static/question_feed_unanswered"
end

post '/add_answer/:question_id' do
	@question = Question.find(params[:question_id])
		@answer = Answer.new(answer: params[:answer], question_id: @question.id, user_id: session[:user_id])
			@answer.save
				@question.no_answers += 1
					@question.save
				@questions = Question.all
			redirect '/question_feed/1'
end

post '/upvote_answer/:answer_id' do
	@answer = Answer.find(params[:answer_id])
		@answer.upvotes_answer += 1
			@answer.save
end

