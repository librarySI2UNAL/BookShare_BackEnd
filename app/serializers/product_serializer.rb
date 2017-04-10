class ProductSerializer < ActiveModel::Serializer
	attributes :id, :special, :available, :value

	belongs_to :product_item, polymorphic: true
	has_many :photos
	class PhotoSerializer < ActiveModel::Serializer
		attributes :url
	end
end