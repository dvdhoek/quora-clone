class CreateUsers < ActiveRecord::Migration
	attr_accessor :encrypted_password

	def change
		create_table :users do |x|
			x.string :username
			x.string :encrypted_password
			x.string :email
			x.string :first_name
			x.string :last_name
			x.timestamps null: false
			x.integer :no_questions, default: 0
			x.integer :no_answers, default: 0
		end
	end
end

# x.integer :click_count, default: 0