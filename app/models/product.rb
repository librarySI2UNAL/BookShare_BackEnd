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
		self.where( available: true ).each do | product |
			aux = self.load_specific_information( product.to_h )
			products.push( aux )
		end

		return products
	end

	def self.load_product( id )
		product = self.find_by_id( id ).to_h

		return self.load_specific_information( product )
	end
end