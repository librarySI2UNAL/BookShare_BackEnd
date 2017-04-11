class Interest < ApplicationRecord
	has_many :users, through: :user_interest
	has_many :genres, through: :interest_genre

	validates :name, presence: true

	def self.load_interest_by_id( id )
		self.find_by_id( id )
	end
end
