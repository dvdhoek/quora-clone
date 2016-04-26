class CreateAnswers < ActiveRecord::Migration

	def change
		create_table :answers do |x|
			x.string :answer
			x.integer :upvotes_answer, default: 0
			x.integer :question_id
			x.integer :user_id
			x.integer :votes_answer, default: 0
			x.integer :downvotes_answer, default: 0

			x.timestamps null: false
		end
	end
end
