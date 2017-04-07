class CollectionsDAO
	def self.assign_collection( collection, collection_h )
		collection.from_json( collection_h.to_json )
		if !collection.valid?
			return { success: false, errors: collection.errors.full_messages }
		end

		collection.save
		return { success: true, collection: collection }
	end

	def self.create_collection( collection_h )
		collection = Collection.new

		return self.assign_collection( collection, collection_h )
	end

	def self.update_collection( id, collection_h )
		collection = Collection.load_collection( id )
		if collection == nil
			return { success: false, error: "The collection was not found" }
		end

		return self.assign_collection( collection, collection_h )
	end
end