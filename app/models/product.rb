class Product < ApplicationRecord
	attr_accessor :description, :special, :available
	belongs_to :product_item, polymorphic: true
end
