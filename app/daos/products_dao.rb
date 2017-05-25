class ProductsDAO
	def self.create_product( user_id, product_h )
		product_h[:user] = User.load_user_by_id( user_id )

		if product_h[:product_item][:type] == "book"
			book_h = product_h[:product_item]
			book_h.delete( :type )
			book_h[:genre] = Genre.load_genre_by_id( book_h[:genre].to_i )
			product_h[:product_item] = Book.create( book_h )
		elsif product_h[:product_item][:type] == "collection"
			collection_h = product_h[:product_item]
			collection_h.delete( :type )
			collection_h[:genre] = Genre.load_genre_by_id( collection_h[:genre].to_i )
			product_h[:product_item] = Collection.create( collection_h )
		end

		Product.create( product_h )
	end

	def self.update_product( user_id, product_h )
		user = User.load_user_by_id( user_id )
		product = Product.load_product_by_id_by_user( product_h.delete( :id ), user )
		if product == nil
			return nil
		end

		if product_h[:product_item][:type] == "book"
			book_h = product_h[:product_item]
			book_h.delete( :type )
			book_h[:genre] = Genre.load_genre_by_id( book_h[:genre].to_i )
			
			book = Book.load_book_by_id( book_h[:id] )
			book.update( book_h )
			product_h[:product_item] = book
		elsif product_h[:product_item][:type] == "collection"
			collection_h = product_h[:product_item]
			collection_h.delete( :type )
			collection_h[:genre] = Genre.load_genre_by_id( collection_h[:genre].to_i )
			
			collection = Collection.load_book_by_id( collection_h[:id] )
			collection.update( collection_h )
			product_h[:product_item] = collection
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

	def self.validate( user_id, product_id )
		Product.exists?( id: product_id, user_id: user_id )
	end
end