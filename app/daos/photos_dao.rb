class PhotosDAO
	def self.create_photo( photo_h, relation )
		if relation == "User"
			user_id = photo_h.delete( :user_id )
		elsif relation == "Product"
			product_id = photo_h.delete( :product_id )
		end
		
		photo = Photo.create( photo_h )
		
		if relation == "User"
			user = User.load_user_by_id( user_id )
			user.photo = photo
			user.save
		elsif relation == "Product"
			product = Product.load_product_by_id( product_id )
			product.photos << photo
			product.save
		end

		return photo
	end

	def self.update_photo(photo_h)
		photo = Photo.load_photo_by_id( id )
		photo.update( photo_h )
		return photo
	end

	def self.delete_photo( id)
		photo = Photo.load_photo_by_id( id )
		if photo == nil
			return false
		end
		photo.destroy
		return true
	end
   
end
