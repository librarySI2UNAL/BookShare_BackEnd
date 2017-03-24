class City < ApplicationRecord
	attr_accessor :placeId, :name
	has_many :users

	validates :placeId, presence: true, uniqueness: true
	validates :name, presence: true
	validates_associated :users
end
