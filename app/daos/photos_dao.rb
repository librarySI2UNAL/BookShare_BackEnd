class PhotosDAO

	def self.create_photo( photo_h)
		 #user_id  = photo_h.delete(:user_id)
		 Photo.create(photo_h)
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
