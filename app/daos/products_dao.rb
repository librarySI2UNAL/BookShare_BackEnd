class ProductsDAO
	def self.create_product( product_h )
		product_h[:user] = User.load_user_by_id( product_h.delete( :user_id ).to_i )

		if product_h[:product_item][:type] == "Book"
			book_h = product_h[:product_item]
			book_h.delete( :type )
			if book_h.has_key?( :id )
				product_h[:product_item] = Book.load_book_by_id( book_h[:id] )
			else
				book_h[:genre] = Genre.load_genre_by_id( book_h[:genre].to_i )
				product_h[:product_item] = Book.create( book_h )
			end
		elsif product_h[:product_item][:type] == "Collection"
			collection_h = product_h[:product_item]
			book_h.delete( :type )
			if collection_h.has_key?( :id )
				product_h[:product_item] = Collection.load_collection_by_id( collection_h[:id] )
			else
				collection_h[:genre] = Genre.load_genre_by_id( collection_h[:genre].to_i )
				product_h[:product_item] = Collection.create( collection_h )
			end
		end

		Product.create( product_h )
	end

	def self.update_product( product_h )
		user = User.load_user_by_id( product_h.delete( :user_id ).to_i )
		product = Product.load_product_by_id_by_user( product_h.delete( :id ), user )
		if product == nil
			return nil
		end
		product.update( product_h )

		return product
	end

	def self.delete_product( product_h )
		user = User.load_user_by_id( product_h.delete( :user_id ).to_i )
		product = Product.load_product_by_id_by_user( product_h.delete( :id ), user )
		if product == nil
			return false
		end
		product.destroy

		return true
	end
end
