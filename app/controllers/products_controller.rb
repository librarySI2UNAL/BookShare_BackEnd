class ProductsController < ApplicationController
	def index
		products = Product.where( available: true )
		render json: { products: products }
	end

	def show
		id = params[:id]
		product = Product.find_by( id: id )
		render json: { product: product }
	end

	def create

	end

	def update

	end
end