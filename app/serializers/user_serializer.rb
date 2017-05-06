class UserSerializer < ActiveModel::Serializer
	attributes :id, :name, :last_name, :email, :qualification, :latitude, :longitude

	belongs_to :photo, serializer: PhotoSerializer
	belongs_to :city, serializer: CitySerializer
	has_many :interests, serializer: InterestSerializer
	
	def as_json(options={})
		{
		:id => id,
	    :name => name,
	    :last_name => last_name,
	    :email => email,
	    :qualification => qualification,
	    :photo => photo.map(&:as_json),
	    :city => city.map(&:as_json),
	    :interests => interests.map(&:as_json)
		}
	end
end