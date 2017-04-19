class Product < ApplicationRecord
	belongs_to :product_item, polymorphic: true
	belongs_to :user
	has_many :photos
	has_many :comments

	validates :special, presence: true
	validates :available, presence: true
	validates :cover, presence: true
	validates :status, presence: true
	validates :value, presence: true
	validates :code, presence: true
	validates :code_type, presence: true

	def self.load_total_products()
		self.count
	end

	def self.load_product_by_id_by_user( id, user )
		self.where( id: id, user: user ).take
	end

	def self.load_product_by_id( id )
		self.find_by_id( id )
	end

	def self.load_available_products_by_user_id( page = 1, per_page = 10, user_id )
		self.where( available: true, user_id: user_id )
			.paginate( page: page, per_page: per_page )
	end

	def self.load_available_products( page = 1, per_page = 10 )
		self.includes( :product_item )
			.where( available: true )
			.paginate( page: page, per_page: per_page )
	end

	def self.load_available_products_by_genre( page = 1, per_page = 10, genre = "" )
		products = []
		self.includes( :product_item )
			.where( available: true ).each do |product|
				if product.product_item.genre.name.downcase.include?( genre.downcase )
					products.push( product )
				end
			end

		products.paginate( page: page, per_page: per_page )
	end

	def self.load_available_products_by_name( page = 1, per_page = 10, name = "" )
		products = []
		self.includes( :product_item )
			.where( available: true ).each do |product|
				if product.product_item.name.downcase.include?( name.downcase )
					products.push( product )
				end
			end

		products.paginate( page: page, per_page: per_page )
	end

	def self.load_available_products_by_author( page = 1, per_page = 10, author = "" )
		products = []
		self.includes( :product_item )
			.where( available: true ).each do |product|
				if product.product_item.author.downcase.include?( author.downcase )
					products.push( product )
				end
			end

		products.paginate( page: page, per_page: per_page )
	end
end