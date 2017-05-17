class UserSerializer < ActiveModel::Serializer
	attributes :id, :name, :last_name, :email, :qualification, :latitude, :longitude

	belongs_to :photo, serializer: PhotoSerializer
	belongs_to :city, serializer: CitySerializer
	has_many :interests, serializer: InterestSerializer
	has_many :product, serializer: ProductSerializer
end