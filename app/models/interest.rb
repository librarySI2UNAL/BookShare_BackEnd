class Interest < ApplicationRecord
	attr_accessor :name, :icon_name
	has_many :users, through: :user_interest

	validates :name, presence: true
	validates :icon_name, presence: true
end
