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
		self.includes( :photos, :comments, product_item: [:genre] )
			.find_by_id( id )
	end

	def self.load_products_by_user_id( page = 1, per_page = 10, user_id, available_val )
		self.where( available: available_val, user_id: user_id )
			.paginate( page: page, per_page: per_page )
	end

	def self.load_available_products( page = 1, per_page = 10 )
		self.includes( :product_item, :photos, :comments )
			.where( available: true )
			.paginate( page: page, per_page: per_page )
	end

	def self.load_available_products_by_genre( page = 1, per_page = 10, genre = "" )
		products = []
		self.includes( :product_item, :photos, :comments )
			.where( available: true ).each do |product|
				if product.product_item.genre.name.downcase.include?( genre.downcase )
					products.push( product )
				end
			end

		products.paginate( page: page, per_page: per_page )
	end

	def self.load_available_products_by_name( page = 1, per_page = 10, name = "" )
		products = []
		self.includes( :product_item, :photos, :comments )
			.where( available: true ).each do |product|
				if product.product_item.name.downcase.include?( name.downcase )
					products.push( product )
				end
			end

		products.paginate( page: page, per_page: per_page )
	end

	def self.load_available_products_by_author( page = 1, per_page = 10, author = "" )
		products = []
		self.includes( :product_item, :photos, :comments )
			.where( available: true ).each do |product|
				if product.product_item.author.downcase.include?( author.downcase )
					products.push( product )
				end
			end

		products.paginate( page: page, per_page: per_page )
	end

	def self.load_available_products_by_search( page = 1, per_page = 10, query = "" )
		
		products = products.where(["genre = ?", query]).or(products.where(["name = ?", query])).or(products.where(["author = ?", query]))

		products.paginate( page: page, per_page: per_page )
	end
	
	def self.load_products_near_user(user_id, latitude, longitude, distance)
		products = Product.where.not(user_id: user_id).where(available: true)
		#products.delete_if {|product| product.calculate_distance(latitude, longitude) > distance}
		result = []
		products.each do |product|
			if product.calculate_distance(latitude, longitude) <= distance.to_f
				result.push(product)
			end
		end
		return result
	end
	
	def calculate_distance(latitude, longitude)
		latitude1 = self.user.latitude
		longitude1 = self.user.longitude
		diffLat = (latitude1-latitude) * Math::PI / 180
		diffLng = (longitude1-longitude) * Math::PI / 180
		x = Math.sin(diffLat * 0.5) * Math.sin( diffLat * 0.5) + Math.cos(latitude * Math::PI / 180) * Math.cos(latitude1 * Math::PI / 180) * Math.sin(diffLng * 0.5) * Math.sin(diffLng * 0.5)
		return 6371 * ( 2 * Math.atan2(Math.sqrt(x), Math.sqrt(1-x)))
	end
	
end