class CitySerializer < ActiveModel::Serializer
	attributes :id, :name, :place_id
end