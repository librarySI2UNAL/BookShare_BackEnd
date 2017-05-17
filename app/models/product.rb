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

	def self.load_product_by_id( id )
		self.includes( :photos, :comments, :user, product_item: [:genre] )
			.find_by_id( id )
	end

	def self.load_products_by_user_id( user_id, available )
		self.includes( :photos, :comments, :user, product_item: [:genre] )
			.where( available: available, user_id: user_id )
	end

	def self.load_available_products( user_id, page = 1, per_page = 10 )
		self.includes( :photos, :comments, :user, product_item: [:genre] )
			.where( available: true ).where.not( user_id: user_id )
			.paginate( page: page, per_page: per_page )
	end

	def self.load_available_products_by_genre( user_id, genreId = 1 )
		products = []
		self.includes( :photos, :comments, :user, product_item: [:genre] )
			.where( available: true ).where.not( user_id: user_id ).each do |product|
				if product.product_item.genre.id == genreId
					products.push( product )
				end
			end

		return products
	end

	def self.load_available_products_by_name( user_id, name = "" )
		products = []
		self.includes( :photos, :comments, :user, product_item: [:genre] )
			.where( available: true ).where.not( user_id: user_id ).each do |product|
				if product.product_item.name.downcase.include?( name.downcase )
					products.push( product )
				end
			end

		return products
	end

	def self.load_available_products_by_author( user_id, author = "" )
		products = []
		self.includes( :photos, :comments, :user, product_item: [:genre] )
			.where( available: true ).where.not( user_id: user_id ).each do |product|
				if product.product_item.author.downcase.include?( author.downcase )
					products.push( product )
				end
			end

		return products
	end
end