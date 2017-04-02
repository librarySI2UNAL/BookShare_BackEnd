class Collection < ApplicationRecord
	include ActiveModel::Serializers::JSON

	# attr_accessor :name, :description, :cover, :status, :author, :genre, :editorial, :year_of_publication, :code_type, :code
	has_many :products, as: :product_item

	validates :name, presence: true
	validates :cover, presence: true
	validates :status, presence: true
	validates :author, presence: true
	validates :genre, presence: true
	validates :editorial, presence: true
	validates :year_of_publication, presence: true
	validates :code_type, presence: true
	validates :code, presence: true

	def to_h
		{
			id: self.id,
			name: self.name,
			cover: self.cover,
			status: self.status,
			author: self.author,
			genre: self.genre,
			editorial: self.editorial,
			year_of_publication: self.year_of_publication,
			code_type: self.code_type,
			code: self.code
		}
	end

	def self.load_collection( id )
		self.find_by_id( id )
	end
end
