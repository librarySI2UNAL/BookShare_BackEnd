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

	def self.load_product_by_id_by_user( id, user )
		self.includes( :photos, :comments, :user, product_item: [:genre] )
			.where( id: id, user: user ).take
	end

	def self.load_products_by_user_id( user_id, available )
		self.includes( :photos, :comments, :user, product_item: [:genre] )
			.where( available: available, user_id: user_id )
	end

	def self.load_available_products( user_id, page = 1, per_page = 10, all = false )
		products_query = self.includes( :photos, :comments, :user, product_item: [:genre] )
			.where( available: true ).where.not( user_id: user_id )
			
		return all ? products_query: products_query.paginate( page: page, per_page: per_page )
	end

	def self.load_available_and_special_products()
		self.includes( :photos, :comments, :user, product_item: [:genre] )
			.where( available: true, special: true ).order('created_at DESC').limit( 10 )
	end

	def self.load_available_products_by_genre_ids( user_id, genre_ids )
		products = []

		self.includes( :photos, :comments, :user, product_item: [:genre] )
			.where( available: true ).where.not( user_id: user_id ).each do |product|
				if genre_ids.include?( product.product_item.genre.id )
					products.push( product )
				end
			end

		return products
	end

	def self.load_available_products_by_name( user_id, name = "", genre_ids )
		products = []
		products_query = []

		if genre_ids.count > 0
			products_query = self.load_available_products_by_genre_ids( user_id, genre_ids )
		else
			products_query = self.load_available_products( user_id, 1, 10, true )
		end

		products_query.each do |product|
			if product.product_item.name.downcase.include?( name.downcase )
				products.push( product )
			end
		end

		return products
	end

	def self.load_available_products_by_author( user_id, author = "", genre_ids )
		products = []
		products_query = []

		if genre_ids.count > 0
			products_query = self.load_available_products_by_genre_ids( user_id, genre_ids )
		else
			products_query = self.load_available_products( user_id, 1, 10, true )
		end

		products_query.each do |product|
			if product.product_item.author.downcase.include?( author.downcase )
				products.push( product )
			end
		end

		return products
	end
	
end