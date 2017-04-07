class ProductsDAO
	def self.assign_product( type, product, product_h, result )
		product.from_json( product_h.to_json )
		if type == "Book"
			product.product_item = result[:book]
		elsif type == "Collection"
			product.product_item = result[:collection]
		end
		if !product.valid?
			return { success: false, errors: product.errors.full_messages }
		end

		product.save
		aux = Product.load_product( product[:id] )
		return { success: true, product: aux }
	end

	def self.create_product( type, product_h )
		if type == "Book"
			result = BooksDAO.create_book( product_h[:book] )
			if !result[:success]
				return result
			end

			product_h.delete( :book )
		elsif type == "Collection"
			result = CollectionsDAO.create_collection( product_h[:collection] )
			if !result[:success]
				return result
			end

			product_h.delete( :collection )
		end

		product = Product.new
		
		return self.assign_product( type, product, product_h, result )
	end

	def self.update_product( type, product_h )
		if type == "Book"
			result = BooksDAO.update_book( product_h[:id], product_h[:book] )
			if !result[:success]
				return result
			end

			product_h.delete( :book )
		elsif type == "Collection"
			result = CollectionsDAO.update_collection( product_h[:id], product_h[:collection] )
			if !result[:success]
				return result
			end

			product_h.delete( :collection )
		end

		product = Product.find_by_id( product_h[:id] )
		if product == nil
			return { success: false, error: "The product was not found" }
		end
		
		return self.assign_product( type, product, product_h, result )
	end
end