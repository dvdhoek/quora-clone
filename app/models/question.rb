class Question <ActiveRecord::Base
	belongs_to :user

	has_many :answers

	self.per_page = 50


end
