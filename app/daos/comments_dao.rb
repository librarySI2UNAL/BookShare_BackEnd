class CommentsDAO

	def self.create_comment( product_id, comment_h )
		product = Product.load_product_by_id( product_id )
		if product == nil
			return nil
		end
		
		user = User.load_user_by_id( comment_h.delete( :user_id ) )
		if user == nil
			return nil
		end
		
		comment_h[:user] = user
		
		comment = Comment.create( comment_h )
		product.comments << comment
		product.save

		return comment
	end

	def self.update_comment( id, comment_h )
		comment = Comment.load_comment_by_id( id )
		if comment == nil
			return nil
		end
		comment.update( comment_h )
		return comment
	end

	def self.delete_comment( id )
		comment = Comment.load_comment_by_id( id )
		if comment == nil
			return false
		end
		comment.destroy
		return true
  end


  end
