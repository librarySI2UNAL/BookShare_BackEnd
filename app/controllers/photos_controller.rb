class PhotosController < ApplicationController
  def create
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
    photo = params[:image]
    photo.user = user

  end

  def update
  end

  def destroy
  end

  def photo_params
    params.require(:data).permit(:file, :file_id, :user_id, :product_id)
  end


end
