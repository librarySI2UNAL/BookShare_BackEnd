class Product < ApplicationRecord
	attr_accessor :description, :special, :available
	belongs_to :product_item, polymorphic: true

	validates :special, presence: true
	validates :available, presence: true

	def self.load_products( page = 1, per_page = 10 )
		self.where( available: true )
	end
end
