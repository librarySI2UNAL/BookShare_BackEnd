class User < ApplicationRecord
	include ActiveModel::Serializers::JSON
	
	# encrypt password
	has_secure_password

	#attr_accessor :name, :last_name, :email, :qualification
	#has_one :photo
	has_many :products
	has_many :interests, through: :user_interest
	
	validates_presence_of :name, :last_name, :password_digest
	validates :email, presence: true, uniqueness: true, format: Devise::email_regexp
end