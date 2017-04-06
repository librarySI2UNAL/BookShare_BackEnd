class User < ApplicationRecord
	has_secure_password

	has_one :photo
	has_many :products
	has_many :interests, through: :user_interest
	
	validates_presence_of :name, :last_name, :password_digest
	validates :email, presence: true, uniqueness: true, format: Devise::email_regexp

	def self.load_user_by_email( email )
		self.find_by_email( email )
	end

	def self.load_user_by_id( id )
		self.find_by_id( id )
	end
end