class UsersController < ApplicationController
	skip_before_action :authorize_request, only: [:create, :validate_email]

	def validate_email
		if !params.has_key?( :email )
			message = Message.invalid_request( "email" )
			render json: { error: message }, status: 400
			return
		end
		exists = UsersDAO.validate_email( params[:email] )

		render json: { exists: exists }
	end

	def show
		if !params.has_key?( :id )
			message = Message.invalid_request( "id" )
			render json: { error: message }, status: 400
			return
		end

		user = User.load_user_by_id( params[:id].to_i )
		if user == nil
			message = Message.not_found( "User" )
			render json: { error: message }, status: 404
			return
		end

		render json: user, root: "data"
	end

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
		if !user.valid?
			render json: { errors: user.errors.full_messages }, status: 400
			return
		end

		message = Message.object_updated( "User" )
		response = { message: message }
		response[:data] = ActiveModelSerializers::SerializableResource.new( user ).as_json[:user]
		render json: response
	end

	def destroy
		deleted = UsersDAO.delete_user( params[:id].to_i )
		if !deleted
			message = Message.not_found( "User" )
			render json: { error: message }, status: 404
			return
		end

		message = Message.object_deleted( "User" )
		render json: { message: message }
	end

	private

	def user_params
		params.require( :data ).permit( :name, :last_name, :email, :password, :qualification, :latitude, :longitude, :photo, interests: [] )
	end
end
