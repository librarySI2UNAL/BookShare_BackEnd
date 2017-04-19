class Genre < ApplicationRecord
	has_and_belongs_to_many :interests

	validates :name, presence: true

	def self.load_genre_by_id( id )
		self.find_by_id( id )
	end

	def load_genres
		return self.all
	end
	#All

end
