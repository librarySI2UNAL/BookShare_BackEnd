class InterestSerializer < ActiveModel::Serializer
	attributes :id, :name

	belongs_to :photo, serializer: PhotoSerializer
	has_many :genres, serializer: GenreSerializer
end