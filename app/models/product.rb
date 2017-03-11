class Product < ApplicationRecord
	attr_accessor :description, :special, :available, :product_type, :product_id
	belongs_to :user
end
