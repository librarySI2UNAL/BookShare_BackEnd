class Collection < ApplicationRecord
	has_many :products, as: :product_item
	has_one :genre

	validates :name, presence: true
	validates :cover, presence: true
	validates :status, presence: true
	validates :author, presence: true
	validates :genre, presence: true
	validates :editorial, presence: true
	validates :year_of_publication, presence: true
	validates :code_type, presence: true
	validates :code, presence: true

	def self.load_collection_by_id( id )
		self.find_by_id( id )
	end
end