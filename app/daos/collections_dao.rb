class CollectionsDAO
	def self.create_book( collection_h )
		collection = Collection.new
		collection.from_json( collection_h.to_json )
		if !collection.valid?
			return { success: false, errors: collection.errors.full_messages }
		end

		collection.save
		return { success: true, collection: collection }
	end
end