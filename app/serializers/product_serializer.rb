class ProductSerializer < ActiveModel::Serializer
	attributes :id, :special, :available, :value
end