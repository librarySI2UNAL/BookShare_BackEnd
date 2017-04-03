class ProductsController < ApplicationController
	def index
		if params.has_key?( :genre )
			products = Product.load_available_products( params[:page], params[:genre] )
		else
			products = Product.load_available_products( params[:page] )
		end
		render json: { products: products }
		return
	end

	def show
		if !params.has_key?( :id )
			render json: { error: "Bad request. The id parameter doesn't exist" }, status: 400
			return
		end
		if params[:id].is_a? Integer
			product = Product.load_product( params[:id] )
			render json: { product: product }
			return
		else
			render json: { error: "Bad request. The id parameter is not a Integer" }, status: 400
			return
		end
	end

	def create
		if !params.has_key?( :type )
			render json: { error: "Bad request. The type parameter doesn't exist" }, status: 400
			return
		end
		if !params.has_key?( :product )
			render json: { error: "Bad request. The product parameter doesn't exist" }, status: 400
			return
		end
		
		result = ProductsDAO.create_product( params[:type], params[:product] )
		if !result[:success] && result.has_key?( :errors )
			render json: { error: "Bad request. The parameters are not valid", errors: result[:errors] }, status: 400
			return
		elsif !result[:success] && result.has_key?( :error )
			render json: { error: result[:error] }, status: 404
			return
		end

		render json: { product: result[:product] }
		return
	end

	def update
		if !params.has_key?( :type )
			render json: { error: "Bad request. The type parameter doesn't exist" }, status: 400
			return
		end
		if !params.has_key?( :product )
			render json: { error: "Bad request. The product parameter doesn't exist" }, status: 400
			return
		end
		
		result = ProductsDAO.update_product( params[:type], params[:product] )
		if !result[:success] && result.has_key?( :errors )
			render json: { error: "Bad request. The parameters are not valid", errors: result[:errors] }, status: 400
			return
		elsif !result[:success] && result.has_key?( :error )
			render json: { error: result[:error] }, status: 404
			return
		end

		render json: { product: result[:product] }
		return
	end
end