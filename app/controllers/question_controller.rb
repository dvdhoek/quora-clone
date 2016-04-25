post '/add_question' do
	@question = Question.new(question: params[:question], details: params[:details], user_id: session[:user_id])
	@question.save
end