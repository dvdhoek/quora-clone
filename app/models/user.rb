require 'bcrypt'
require 'byebug'

class User <ActiveRecord::Base
	attr_accessor :password
	include BCrypt

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
