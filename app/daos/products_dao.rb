class ProductsDAO
	def self.create_product( type, product_h )
		if type == "Book"
			result = BooksDAO.create_book( product_h[:book] )
			if !result[:success]
				return result
			end

			product_h.delete( :book )
		elsif type == "Collection"
			result = ProductsDAO.create_book( product_h[:collection] )
			if !result[:success]
				return result
			end

			product_h.delete( :collection )
		end

		product = Product.new
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
end