class Photo < ApplicationRecord
	attr_accessor :name, :url

	validates :name, presence: true
	validates :url, presence: true
end
