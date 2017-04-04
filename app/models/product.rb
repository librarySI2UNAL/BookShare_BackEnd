class Product < ApplicationRecord
	include ActiveModel::Serializers::JSON

	# attr_accessor :description, :special, :available
	belongs_to :product_item, polymorphic: true

	validates :special, presence: true
	validates :available, presence: true

	def to_h
		{
			id: self.id,
			special: self.special,
			available: self.available,
			product_item_id: self.product_item_id,
			product_item_type: self.product_item_type
		}
	end

	def self.load_specific_information( product )
		if product[:product_item_type] == "Book"
			product[:book] = Book.load_book( product[:product_item_id] ).to_h
		elsif product[:product_item_type] == "Collection"
			product[:collection] = Collection.load_collection( product[:product_item_id] ).to_h
		end
		product.delete( :product_item_id )
		product.delete( :product_item_type )
	
		return product
	end

	def self.load_available_products( page = 1, per_page = 10 )
		products = []
		self.where( available: true ).paginate( page: page, per_page: per_page ).each do | product |
			aux = self.load_specific_information( product.to_h )
			products.push( aux )
		end

		return products
	end

	def self.load_available_products_by_genre( page = 1, per_page = 10, genre = -1 )
		products = []
		self.where( available: true ).each do | product |
			aux = self.load_specific_information( product.to_h )
			if ( aux.has_key?( :book ) && aux[:book][:genre] == genre ) || 
				( aux.has_key?( :collection ) && aux[:collection][:genre] == genre )
				products.push( aux )
			end
		end

		return products
	end

	def self.load_available_products_by_author( page = 1, per_page = 10, author = "" )
		products = []
		self.where( available: true ).each do | product |
			aux = self.load_specific_information( product.to_h )
			if ( aux.has_key?( :book ) && aux[:book][:author] == author ) || 
				( aux.has_key?( :collection ) && aux[:collection][:author] == author )
				products.push( aux )
			end
		end

		return products
	end

	def self.load_product( id )
		product = self.find_by_id( id )
		if product == nil
			return { success: false, error: "The product was not found" }
		end

		product_h = product.to_h

		return { success: true, product: self.load_specific_information( product_h ) }
	end
end