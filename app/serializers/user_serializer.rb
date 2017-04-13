class UserSerializer < ActiveModel::Serializer
	attributes :id, :name, :last_name, :email, :qualification, :latitude, :longitude

	belongs_to :city, serializer: CitySerializer
	has_many :interests, serializer: InterestSerializer
end