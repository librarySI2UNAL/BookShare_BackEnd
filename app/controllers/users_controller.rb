class UsersController < ApplicationController
	skip_before_action :authorize_request, only: :create

	def create
		user = UsersDAO.create_user( user_params )
		auth_token = AuthenticateUser.new( user.email, user.password ).call

		message = Message.object_created( "User" )
		render json: { message: message, token: auth_token, data: user }
	end

	def update
		user = UsersDAO.update_user( params[:id].to_i, user_params )

		message = Message.object_updated( "User" )
		render json: { message: message, data: user }
	end

	private

	def user_params
		params.require( :data ).permit( :name, :last_name, :email, :password )
	end
end