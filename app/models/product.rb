class Product < ApplicationRecord
	attr_accessor :description, :special, :available
	belongs_to :product_item, polymorphic: true

	validates :special, presence: true
	validates :available, presence: true
end
