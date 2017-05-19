class CommentsController < ApplicationController
	def create
		comment = CommentsDAO.create_comment( params[:product_id].to_i, comment_params )

		if comment == nil
			message = Message.not_found( "User" )
			render json: { error: message }, status: 400
			return
		end

		message = Message.object_created( "Comment" )
		response = { message: message}
		response[:data] = ActiveModelSerializers::SerializableResource.new( comment ).as_json[:comment]
		render json: response
	end

	def update
		comment = CommentsDAO.update_comment(params[:id].to_i, comment_params)
		if comment == nil
			message = Message.not_found("Comment")
			render json: {error: message}, status: 400
			return
		end
		message = Message.object_updated( "Comment" )
		response = { message: message}
		response[:data] = ActiveModelSerializers::SerializableResource.new( comment ).as_json[:comment]
		render json: response
	end

	def destroy
		deleted = CommentsDAO.delete_comment( params[:id].to_i )
		if !deleted
			message = Message.not_found( "Comment" )
			render json: { error: message }, status: 404
			return
		end
	end

	private
	def comment_params
		params.require( :data ).permit( :comment, :user_id )
	end

end
