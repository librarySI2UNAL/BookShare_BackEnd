class ProductsController < ApplicationController
	def collection
		products = Product.load_available_products_by_user_id( params[:page], params[:per_page], params[:user_id].to_i )
		render json: products, root: "data"
	end

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
		render json: products, root: "data"
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
		product = ProductsDAO.create_product( product_params )

		message = Message.object_created( "Product" )
		render json: { message: message, data: product }
	end

	def update
		product = ProductsDAO.update_product( params[:id].to_i, product_params )

		message = Message.object_updated( "Product" )
		render json: { message: message, data: product }
	end

	def destroy

	end

	private

	def product_params
		params.require( :data ).permit( :special, :available, book: [:name, :description, :cover, :status, :author, :genre, :editorial, :year_of_publication, :code, :code_type], collection: [:name, :description, :cover, :status, :author, :genre, :editorial, :year_of_publication, :code, :code_type] )
	end
end