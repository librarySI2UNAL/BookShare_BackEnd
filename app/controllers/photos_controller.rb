class PhotosController < ApplicationController
  def create
    if !params.has_key?( :id )
			message = Message.invalid_request( "id" )
			render json: { error: message }, status: 400
			return
		end
    user =


  end

  def update
  end

  def destroy
  end

  def photo_params
    params.require(:data).permit(:file, :file_id, :user_id, :product_id)
  end


end
