class City < ApplicationRecord
	has_many :users

	validates :place_id, presence: true, uniqueness: true
	validates :name, presence: true
	validates_associated :users
end
