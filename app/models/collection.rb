class Collection < ApplicationRecord
	attr_accessor :name, :description, :genre, :editorial, :year_of_publication, :code_type, :code
	has_many :products, as: :product_item
end
