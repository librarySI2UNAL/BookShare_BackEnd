class BookSerializer < ActiveModel::Serializer
	attributes :name, :author, :editorial, :year_of_publication

	belongs_to :genre, serializer: GenreSerializer
end