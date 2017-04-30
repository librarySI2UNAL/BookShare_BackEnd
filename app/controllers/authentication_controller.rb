class AuthenticationController < ApplicationController
	skip_before_action :authorize_request, only: :authenticate

	def authenticate
		if !params.has_key?( :email )
			message = Message.invalid_request( "email" )
			render json: { error: message }, status: 400
			return
		end
		if !params.has_key?( :password )
			message = Message.invalid_request( "password" )
			render json: { error: message }, status: 400
			return
		end
		user = User.load_user_by_email( params[:email] )

		auth_token = AuthenticateUser.new( params[:email], params[:password] ).call

		response = { token: auth_token }
		response[:data] = ActiveModelSerializers::SerializableResource.new( user ).as_json[:user]
		render json: response
	end
end