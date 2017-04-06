class UsersController < ApplicationController
	skip_before_action :authorize_request, only: :create

	def create
		if !params.has_key?( :user )
			message = Message.invalid_request( "user" )
			render json: { error: message }, status: 400
			return
		end

		user = UsersDAO.create_user( params[:user] )
		auth_token = AuthenticateUser.new( user.email, user.password ).call

		message = Message.account_created
		render json: { message: message, token: auth_token }
	end

	def update
		if !params.has_key?( :user )
			message = Message.invalid_request( "user" )
			render json: { error: message }, status: 400
			return
		end

		user = AuthorizeApiRequest.new( user.email, user.password ).call
		user = UsersDAO.create_user( params[:user] )

		message = Message.account_created
		render json: { message: message, token: auth_token }
	end
end