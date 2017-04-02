class Product < ApplicationRecord
	attr_accessor :description, :special, :available
	belongs_to :product_item, polymorphic: true
	self.per_page = 10

	validates :special, presence: true
	validates :available, presence: true

	def self.load_available_products( page = 2 )
		self.all()
			.paginate( page: page )
	end
end
