class Interest < ApplicationRecord
	attr_accessor :name, :icon_name
	has_many :users, through: :user_interest
end
