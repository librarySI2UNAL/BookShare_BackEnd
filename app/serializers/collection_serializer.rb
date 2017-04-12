class CollectionSerializer < ActiveModel::Serializer
	attributes :name, :cover, :status, :author, :editorial, :year_of_publication, :code_type, :code

	has_one :genre, serializer: GenreSerializer
end