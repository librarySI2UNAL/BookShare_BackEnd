class UsersController < ApplicationController
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
		
		render json: { errors: user.errors.full_messages }, status: 400
	end
end