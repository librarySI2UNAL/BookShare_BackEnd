class ProductsController < ApplicationController
	def index
		products = []
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
		return
	end

	def show
		if !params.has_key?( :id )
			render json: { error: "Bad request. The id parameter doesn't exist" }, status: 400
			return
		end
		if params[:id].to_i > 0
			result = Product.load_product( params[:id] )
			if result[:success]
				render json: { product: result[:product] }
			elsif result.has_key?( :error )
				render json: { error: result[:error] }, status: 404
			elsif result.has_key?( :errors )
				render json: { errors: result[:errors] }, status: 404
			end
			return
		else
			render json: { error: "Bad request. The id parameter is invalid" }, status: 400
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