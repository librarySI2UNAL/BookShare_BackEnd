class Genre < ApplicationRecord
	has_and_belongs_to_many :interests

	validates :name, presence: true
end