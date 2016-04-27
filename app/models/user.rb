require 'bcrypt'
require 'byebug'

class User <ActiveRecord::Base
	include ActiveModel::Validations

    validates :email, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true
    validates :password, presence: true
    
	include BCrypt

	has_many :questions
	has_many :answers
	
	def password
		@password ||= Password.new(encrypted_password)
	end

	def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end

	def login(password)
		if self.password == password
			return true
		else
			return false
		end
	end
end

