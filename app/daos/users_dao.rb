class UsersDAO
	def self.create_user( user_h )
		latitude = user_h.delete( :latitude )
		longitude = user_h.delete( :longitude )
		city = City.load_city_by_position( latitude, longitude )
		user_h[:city_id] = city.id

		User.create( user_h )
	end

	def self.update_user( id, user_h )
		user = User.load_user_by_id( id )
		user.update( user_h )

		return user
	end

	def self.delete_user( id )
		user = User.load_user_by_id( id )
		if user == nil
			return false
		end

		user.destroy
		return true
	end
end