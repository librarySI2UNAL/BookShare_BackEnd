class ProductSerializer < ActiveModel::Serializer
	attributes :id, :special, :available, :value

	belongs_to :product_item, polymorphic: true
	has_many :photos, serializer: PhotoSerializer
	has_many :comments, serializer: CommentSerializer
end