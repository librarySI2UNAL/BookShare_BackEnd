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

		response = { count: Product.load_total_products() }
		response[:data] = ActiveModelSerializers::SerializableResource.new( products ).as_json[:products]
		render json: response
	end

	def show
		product = Product.load_product_by_id( params[:id].to_i )
		if product == nil
			message = Message.not_found( "Product" )
			render json: { error: message }, status: 404
			return
		end

		render json: product, root: "data", include: "**"
	end

	def create
		product = ProductsDAO.create_product( product_params )

		message = Message.object_created( "Product" )
		response = { message: message }
		response[:data] = ActiveModelSerializers::SerializableResource.new( product ).as_json[:product]
		render json: response
	end

	def update
		product = ProductsDAO.update_product( product_params )
		if product == nil
			message = Message.not_found( "Product" )
			render json: { error: message }
			return
		elsif !product.valid?
			render json: { error: product.errors.full_messages }
			return
		end

		message = Message.object_updated( "Product" )
		response = { message: message }
		response[:data] = ActiveModelSerializers::SerializableResource.new( product ).as_json[:product]
		render json: response
	end

	def destroy
		deleted = ProductsDAO.delete_product( product_params )
		if !deleted
			message = Message.not_found( "Product" )
			render json: { error: message }
			return
		end

		message = Message.object_deleted( "Product" )
		render json: { message: message }
	end

	private

	def product_params
		params.require( :data ).permit( :user_id, :id, :special, :available, :description, :cover, :status, :value, :code, :code_type, product_item: [:type, :id, :name, :author, :genre, :editorial, :year_of_publication] )
	end
	
	def q_search
		
		if !params.has_key?( :q )
			message = Message.invalid_request( "q parameter" )
			render json: { error: message }, status: 400
			return
		end
		
		q = params[:q]
		p_name = Product.load_available_products_by_name(name = q)
		p_genre = Product.load_product_by_genre(genre = q)
		p_author = Product.load_product_by_author(author = q)
		
		if p_name.any?
			
			message = Message.object_updated( "Product" )
			response = { message: message }
			response[:q] = ActiveModelSerializers::SerializableResource.new( product ).as_json[:q]
			
			render json: { p_name }, status 909
			else
				if p_author.any?
					render json: {p_author}
				else
					if p_genre.any?
						render json: {p_genre}
					end
				end
		end
		
		
		
		
		
	end
	
	
end