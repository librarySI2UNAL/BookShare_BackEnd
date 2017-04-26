class User < ApplicationRecord
	has_secure_password

	belongs_to :city
	belongs_to :photo, optional: true
	has_and_belongs_to_many :interests

	validates :name, presence: true
	validates :last_name, presence: true
	validates :password_digest, presence: true
	validates :email, presence: true, uniqueness: true, format: Devise::email_regexp
	validates :qualification, presence: true

	def self.load_user_by_email( email )
		self.find_by_email( email )
	end

	def self.load_user_by_id( id )
		self.find_by_id( id )
	end

	def self.exists_user_with_email( email )
		self.exists?( email: email )
	end
end