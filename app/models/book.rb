class Book < ApplicationRecord
	attr_accessor :name, :description, :cover, :status, :author, :genre, :editorial, :year_of_publication, :code_type, :code
	has_many :products, as: :product_item

	validates :name, presence: true
	validates :description
	validates :cover, presence: true
	validates :status, presence: true
	validates :author, presence: true
	validates :genre, presence: true
	validates :editorial, presence: true
	validates :year_of_publication, presence: true
	validates :code_type, presence: true
	validates :code, presence: true
end