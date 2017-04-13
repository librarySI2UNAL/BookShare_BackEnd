class BookSerializer < ActiveModel::Serializer
	attributes :name, :cover, :status, :author, :editorial, :year_of_publication, :code_type, :code

	belongs_to :genre, serializer: GenreSerializer
end