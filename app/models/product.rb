class Product < ApplicationRecord
	belongs_to :product_item, polymorphic: true
	belongs_to :user, :inverse_of => :product
	has_many :photos
	has_many :comments

	validates :special, presence: true
	validates :available, presence: true
	validates :cover, presence: true
	validates :status, presence: true
	validates :value, presence: true
	validates :code, presence: true
	validates :code_type, presence: true

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

	def self.load_available_products( user_id, page = 1, per_page = 10 )
		self.includes( :product_item, :photos, :comments )
			.where( available: true ).where.not( user_id: user_id )
			.paginate( page: page, per_page: per_page )
	end

	def self.load_available_products_by_genre( user_id, genreId = 1 )
		products = []
		self.includes( :product_item, :photos, :comments )
			.where( available: true ).where.not( user_id: user_id ).each do |product|
				if product.product_item.genre.id == genreId
					products.push( product )
				end
			end

		return products
	end

	def self.load_available_products_by_name( user_id, name = "" )
		products = []
		self.includes( :product_item, :photos, :comments )
			.where( available: true ).where.not( user_id: user_id ).each do |product|
				if product.product_item.name.downcase.include?( name.downcase )
					products.push( product )
				end
			end

		return products
	end

	def self.load_available_products_by_author( user_id, author = "" )
		products = []
		self.includes( :product_item, :photos, :comments )
			.where( available: true ).where.not( user_id: user_id ).each do |product|
				if product.product_item.author.downcase.include?( author.downcase )
					products.push( product )
				end
			end

		return products
	end
	
	def self.filtering(query = "", sorting = "", columns = "", page = 1, per_page = 10)
		res = self.all
		
		unless query.to_s.strip.empty?
			res = res.where(["genre = ?", query]).or(products.where(["name = ?", query])).or(products.where(["author = ?", query]))
		end
		unless sorting.to_s.strip.empty?
			f = sorting.split(',')
			query = Array.new
			f.each do |field|
				column = field[0] == '-' ? f[1..-1] : f
				order = field[0] == '-' ? 'DESC' : 'ASC'
				if Product.new.has_attribute?(column)
					query.push("#{column} #{order}")
				end
			end
			res = res.order(query.join(","))
		end
		unless columns.to_s.strip.empty?
			f = columns.split(',')
			query = Array.new
			f.each do |column|
				if Product.new.has_attribute?(column)
					query.push("#{column}")
				end
			end
			res = res.select(query.join(","))
		end
		return res.paginate( page: page, per_page: per_page )
	end
end