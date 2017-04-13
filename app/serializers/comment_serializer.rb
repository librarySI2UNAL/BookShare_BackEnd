class CommentSerializer < ActiveModel::Serializer
	attributes :comment

	belongs_to :user, serializer: UserSerializer
end