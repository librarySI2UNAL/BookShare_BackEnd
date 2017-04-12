class AuthenticationController < ApplicationController
	#skip_before_action :authorize_request, only: :authenticate

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

		auth_token = AuthenticateUser.new( params[:email], params[:password] ).call

		render json: { auth_token: auth_token }
	end
end