class Product < ApplicationRecord
	belongs_to :product_item, polymorphic: true
	has_many :photos

	validates :special, presence: true
	validates :available, presence: true
	validates :value, presence: true

	def self.load_product_by_id( id )
		self.find_by_id( id )
	end

	def self.load_available_products( page = 1, per_page = 10 )
		self.includes( :product_item )
			.where( available: true )
			.paginate( page: page, per_page: per_page )
	end

	def self.load_available_products_by_genre( page = 1, per_page = 10, genre = -1 )
		self.includes( :product_item )
			.where( available: true, product_item: { genre: genre } )
			.paginate( page: page, per_page: per_page )
	end

	def self.load_available_products_by_name( page = 1, per_page = 10, name = "" )
		self.includes( :product_item )
			.where( available: true, product_item: { name: name } )
			.paginate( page: page, per_page: per_page )
	end

	def self.load_available_products_by_author( page = 1, per_page = 10, author = "" )
		self.includes( :product_item )
			.where( available: true, product_item: { author: author } )
			.paginate( page: page, per_page: per_page )
	end
end