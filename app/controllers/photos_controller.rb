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
		
		old = load_photo_by_id(params[:image_id])
		old.destroy
		
		photo = PhotosDAO.create_photo(photo_params)
		
		if !photo.valid?
			message = Message.invalid_request( "id" )
			render json: { error: message }, status: 400
			return
		end
		
		if !params.has_key?( :image )
			message = Message.invalid_request( "image" )
			render json: { error: message }, status: 400
			return
		end

		user = User.find_by_id(:id)
		user.photo = photo
		
		message = Message.object_updated( "Photo" )
		response = { message: message }
		response[:data] = ActiveModelSerializers::SerializableResource.new( photo ).as_json[:photo]
		render json: response
	end

	def destroy
		old = Photo.load_photo_by_id( params[:id].to_i )
		old.destroy
	end

=begin	def photo_params
		params.require( :data ).permit( :id, :user_id, :product_id, :file )
	end
=end
end
