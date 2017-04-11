class UsersDAO
	def self.create_user( user_h )
		latitude = user_h.delete( :latitude )
		longitude = user_h.delete( :longitude )
		interests = user_h.delete( :interests )
		user_h[:city] = City.load_city_by_position( latitude, longitude )

		user = User.create( user_h )
		puts interests
		#user_h[:interests].each do |interest_id|
		#	interest = Interest.load_interest_by_id( interest_id )
		#	user.interests << interest
		#end

		return user
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