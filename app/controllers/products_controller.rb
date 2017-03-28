class ProductsController < ApplicationController
	def index
		products = Product.where( available: true )
		render json: { products: products }
		return
	end

	def show
		id = params[:id]
		product = Product.find_by( id: id )
		if product == nil
			render json: { error: "Product doesn't exist" }, status: 404
			return
		else
			render json: { product: product }
			return
		end
	end

	def create

	end

	def update

	end
end