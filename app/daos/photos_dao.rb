class PhotosDAO
  def self.create_photo( photo_h )
		photo = Photo.create(photo_h)    
  end

	def self.update_photo( id, user_h )
		photo = Photo.load_photo_by_id( id )
		photo.update( user_h )
		return user
	end

	def self.delete_photo( id )
		photo = Photo.load_photo_by_id( id )
		if photo == nil
			return false
		end
		photo.destroy
		return true
	end
end
