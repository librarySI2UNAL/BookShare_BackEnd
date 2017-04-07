class ProductsController < ApplicationController
	def index
		if params.has_key?( :genre )
			products = Product.load_available_products_by_genre( params[:page], params[:per_page], params[:genre].to_i )
		elsif params.has_key?( :name )
			products = Product.load_available_products_by_name( params[:page], params[:per_page], params[:name] )
		elsif params.has_key?( :author )
			products = Product.load_available_products_by_author( params[:page], params[:per_page], params[:author] )
		else
			products = Product.load_available_products( params[:page], params[:per_page] )
		end
		render json: { products: products }
	end

	def show
		product = Product.load_product_by_id( params[:id].to_i )
		if product == nil
			message = Message.not_found( "Product" )
			render json: { error: message }, status: 404
			return
		end

		render json: { product: product }
	end

	def create
		render json: {}
	end

	def update
		render json: {}
	end
end