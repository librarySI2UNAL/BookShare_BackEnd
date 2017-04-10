class UsersDAO
	def self.create_user( user )
		User.create( user )
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