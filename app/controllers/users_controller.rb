class UsersController < ApplicationController
	def login
		if !params.has_key?( :email )
			render json: { error: "Bad request. The object email doesn't exist" }, status: 400
			return
		end
		if !params.has_key?( :password )
			render json: { error: "Bad request. The object password doesn't exist" }, status: 400
			return
		end
		user = User.find_by( email: params[:email] )
		if user == nil
			render json: { error: "User doesn't exist" }, status: 404
			return
		end
		if !user.authenticate( params[:password] )
			render json: { error: "Error in authentication" }, status: 401
			return
		end

		render json: { user: user }
		return
	end

	def create
		if !params.has_key?( :user )
			render json: { error: "Bad request. The object user doesn't exist" }, status: 400
			return
		end
		user = User.new
		user.from_json( params[:user].to_json )
		if user.valid?
			user.save
			render json: { user: user }
			return
		end
		
		render json: { errors: user.errors.full_messages }, status: 400
	end

	def update
		if !params.has_key?( :user )
			render json: { error: "Bad request. The object user doesn't exist" }, status: 400
			return
		end
		user = User.find_by( id: params[:user][:id] )
		user.from_json( params[:user].to_json )
		if user.valid?
			user.save
			render json: { user: user }
			return
		end
		
		render json: { errors: user.errors.full_messages }, status: 400
	end
end