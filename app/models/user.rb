class User < ApplicationRecord
	attr_accessor :name, :last_name, :email, :qualification
	belongs_to :photo
	has_many :products
	has_many :interests, through: :user_interest
end
