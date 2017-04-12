class Interest < ApplicationRecord
	has_and_belongs_to_many :users
	has_and_belongs_to_many :genres

	validates :name, presence: true

	def self.load_interest_by_id( id )
		self.find_by_id( id )
	end
end
