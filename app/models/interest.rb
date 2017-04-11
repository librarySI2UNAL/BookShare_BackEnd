class Interest < ApplicationRecord
	has_many :users, through: :user_interest
	has_many :genres, through: :interest_genre

	validates :name, presence: true
end
