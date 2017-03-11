class Product < ApplicationRecord
	attr_accessor :description, :special, :available
	belongs_to :user, :product_item, polymorphic: true
end
