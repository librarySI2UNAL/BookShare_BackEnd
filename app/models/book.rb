class Book < ApplicationRecord
	attr_accessor :name, :description, :cover, :status, :author, :genre, :editorial, :year_of_publication, :code_type, :code
	belongs_to :collection
	has_many :products, as: :product_item
end
