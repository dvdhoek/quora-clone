require 'faker'

class Seed <ActiveRecord::Base
	def self.question_seed
		500.times do |question|
			text = Faker::Hipster.sentence
			text[-1] = "?"
			detailtext = Faker::Hipster.sentence
			Question.create(question: text, user_id: 1, details: detailtext)
		end
	end

	def self.answer_seed
		350.times do |answer|
			text = Faker::Hipster.paragraph
			question_id = rand(1..100)
			Answer.create(answer: text, question_id: question_id, user_id: 1)
		end
	end
end

Seed.question_seed
Seed.answer_seed