class CreateQuestions < ActiveRecord::Migration

	def change
		create_table :questions do |x|
			x.string :question
			x.string :details
			x.integer :user_id

			x.timestamps null: false
		end
	end
end
