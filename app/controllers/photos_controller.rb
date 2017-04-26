class PhotosController < ApplicationController

	def create
		if !params.has_key?( :file )
			message = Message.invalid_request( "file" )
			render json: { error: message }, status: 400
			return
		end

		photo_h = {}
		photo_h[:image] = params[:file]
		if params.has_key?( :user_id )
			relation = "User"
			photo_h[:user_id] = params[:user_id]
		elsif params.has_key?( :product_id )
			relation = "Product"
			photo_h[:product_id] = params[:product_id]
		end
		
		photo = PhotosDAO.create_photo( photo_h, relation )

		render json: photo
	end

	def update
		if !params.has_key?( :file )
			message = Message.invalid_request( "file" )
			render json: { error: message }, status: 400
			return
		end
		
		photo_h = {}
		photo_h[:image] = params[:file]
		photo_h[:id] = params[:id].to_i
		if params.has_key?( :user_id )
			relation = "User"
			photo_h[:user_id] = params[:user_id]
		elsif params.has_key?( :product_id )
			relation = "Product"
			photo_h[:product_id] = params[:product_id]
		end

		photo = PhotosDAO.update_photo( photo_h, relation )
		
		message = Message.object_updated( "Photo" )
		response = { message: message }
		response[:data] = ActiveModelSerializers::SerializableResource.new( photo ).as_json[:photo]
		render json: response
	end

	def destroy
		deleted = PhotosDAO.delete_photo( params[:id].to_i )
		if !deleted
			message = Message.not_found( "Photo" )
			render json: { error: message }
			return
		end

		message = Message.object_deleted( "Photo" )
		render json: { message: message }
	end

	def destroy_collection
		PhotosDAO.delete_photos( photo_params )

		message = Message.object_deleted( "Photos" )
		render json: { message: message }
	end

	private

	def photo_params
		params.require( :data ).permit( :ids )
	end
end
