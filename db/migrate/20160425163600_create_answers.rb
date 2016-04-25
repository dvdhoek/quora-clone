class CreateAnswers < ActiveRecord::Migration

	def change
		create_table :answers do |x|
			x.string :answer
			x.integer :upvotes_answer
			x.integer :question_id
			x.integer :user_id
			x.integer :votes_answer
			x.integer :downvotes_answer

			x.timestamps null: false
		end
	end
end
