class Collection < ApplicationRecord
	attr_accessor :name, :description, :genre, :editorial, :year_of_publication, :code_type, :code
	has_many :products, as: :product_item, :books

	validates :name, presence: true
	validates :description
	validates :genre, presence: true
	validates :editorial, presence: true
	validates :year_of_publication, presence: true
	validates :code_type, presence: true
	validates :code, presence: true
end
