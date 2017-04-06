class Interest < ApplicationRecord
	has_many :users, through: :user_interest

	validates :name, presence: true
	validates :icon_name, presence: true
end
