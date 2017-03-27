class ProductsController < ApplicationController
	def index
		@products = Product.where( available: true )
		render json: { products: @products }
	end

	def show

	end

	def create

	end

	def update

	end
end