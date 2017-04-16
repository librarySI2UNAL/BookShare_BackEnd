class CommentsDAO

  def self.create_comment( comment_h )
    user = User.load_user_by_id(comment_h.delete(:user_id))
    if user == nil
      return nil
    end
    comment_h[:user] = user
		Comment.create( comment_h )
	end

	def self.update_comment( id, comment_h )
		comment = Comment.load_comment_by_id( id )
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
