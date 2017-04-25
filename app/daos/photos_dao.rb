class PhotosDAO
  def self.create_photo( photo_h )
		photo = Photo.create(photo_h)
  end

	def self.update_photo( photo_params )
		photo = Photo.load_photo_by_id( id )
		photo.update(id , user_id)
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
