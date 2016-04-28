require 'faker'

class Seed <ActiveRecord::Base
	def self.question_seed
		500.times do |question|
			text = Faker::Hipster.sentence
			text[-1] = "?"
			detailtext = Faker::Hipster.sentence
			user_id = rand(1..300)
			Question.create(question: text, user_id: user_id, details: detailtext)
		end
	end

	def self.answer_seed
		1000.times do |answer|
			text = Faker::Hipster.paragraph
			question_id = rand(1..500)
			user_id = rand(1..300)
			Answer.create(answer: text, question_id: question_id, user_id: user_id)
		end
	end

	def self.user_seed
		300.times do |user|
			first_name = Faker::Name.first_name
			last_name = Faker::Name.last_name
			email = Faker::Internet.email
			password = "default"
			User.create(username: first_name, first_name: first_name, last_name: last_name, email: email, password: password)
		end
	end
end

Seed.question_seed

