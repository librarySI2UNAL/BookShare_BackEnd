class Comment < ApplicationRecord
	belongs_to :user

	validates :comment, presence: true

	def self.load_comment_by_id( id )
		self.includes( :user )
			.find_by_id( id )
	end
end