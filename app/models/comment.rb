class Comment < ApplicationRecord
	belongs_to :user

	validates :comment, presence: true

	self.load_comment_by_id( id )
	{
		self.find_by_id( id )
	}
end