class ProductSerializer < ActiveModel::Serializer
	attributes :id, :special, :available, :cover, :status, :value, :code, :code_type

	belongs_to :product_item, polymorphic: true, include: true, serializer: BookSerializer
	has_many :photos, serializer: PhotoSerializer
	has_many :comments, serializer: CommentSerializer
end
