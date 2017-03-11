class City < ApplicationRecord
	attr_accessor :placeId, :name
	has_many :users
end
