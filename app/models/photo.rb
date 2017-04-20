class Photo < ApplicationRecord
	#:file FotoUploader
end

def self.load_photo_by_id( id )
	self.find_by_id( id )
end
