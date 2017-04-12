class UserSerializer < ActiveModel::Serializer
	attributes :id, :name, :last_name, :email, :qualification

	belongs_to :city, serializer: CitySerializer
	has_many :interests, serializer: InterestSerializer
end