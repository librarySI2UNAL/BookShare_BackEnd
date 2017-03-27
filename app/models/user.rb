class User < ApplicationRecord
	attr_accessor :name, :last_name, :email, :qualification
	belongs_to :photo
	has_many :products
	has_many :interests, through: :user_interest

	validates :name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true, format: Devise::email_regexp
end
