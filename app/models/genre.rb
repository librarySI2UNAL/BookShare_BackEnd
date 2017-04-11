class Genre < ApplicationRecord
	has_many :interests, through: :interest_genre

	validates :name, presence: true
end