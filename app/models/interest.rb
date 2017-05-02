class Interest < ApplicationRecord
	has_and_belongs_to_many :users
	has_and_belongs_to_many :genres
	belongs_to :photo, optional: true

	validates :name, presence: true

	def self.load_interest_by_id( id )
		self.includes( :photo ).find_by_id( id )
	end

	def self.load_interests_by_ids( ids )
		self.includes( :photo ).where( id: ids )
	end

	def self.load_interests()
		self.includes( :photo ).all
	end
end
