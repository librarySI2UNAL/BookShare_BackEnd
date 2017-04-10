class UsersController < ApplicationController
	#skip_before_action :authorize_request, only: :create

	def create
		user = UsersDAO.create_user( user_params )
		if !user.valid?
			render json: { errors: user.errors.full_messages }, status: 400
			return
		end
		auth_token = AuthenticateUser.new( user.email, user.password ).call

		message = Message.object_created( "User" )
		response = { message: message, token: auth_token }
		response[:data] = ActiveModelSerializers::SerializableResource.new( user ).as_json[:user]
		render json: response
	end

	def update
		user = UsersDAO.update_user( params[:id].to_i, user_params )

		message = Message.object_updated( "User" )
		render json: { message: message, data: user }
	end

	def destroy

	end

	private

	def user_params
		params.require( :data ).permit( :name, :last_name, :email, :password )
	end
end