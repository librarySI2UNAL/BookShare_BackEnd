class PhotosController < ApplicationController
  
  def create
    
    if !params.has_key?( :user_id ) && !params.has_key?( :product_id )
		  message = Message.invalid_request( "id" )
		  render json: { error: message }, status: 400
		  return
	  end
		
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
    old = Photo.load_photo_by_id(params[:image_id].to_i)
    old.destroy
  end

  def photo_params
    params.require(:data).permit(:image, :image_id, :user_id, :product_id)
  end


end
