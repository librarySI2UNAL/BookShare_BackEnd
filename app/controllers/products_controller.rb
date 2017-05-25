# encoding: utf-8
class ProductsController < ApplicationController
	skip_before_action :authorize_request, only: [:special_collection]

	def validate
		exists = ProductsDAO.validate( params[:user_id].to_i, params[:product_id].to_i )

		render json: { exists: exists }
	end
	
	def collection
		products = Product.load_products_by_user_id( params[:user_id].to_i, params[:available] == "true" )
		render json: products, root: "data", include: "**"
	end

	def special_collection
		products = Product.load_available_and_special_products()
		render json: products, root: "data", include: "**"
	end

	def index
		products = Product.load_available_products( params[:user_id].to_i, params[:page], params[:per_page] )

		response = { count: products.count }
		response[:data] = ActiveModelSerializers::SerializableResource.new( products, include: "**" ).as_json[:products]
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
		product = ProductsDAO.create_product( params[:user_id].to_i, product_params )

		message = Message.object_created( "Product" )
		response = { message: message }
		response[:data] = ActiveModelSerializers::SerializableResource.new( product, include: "**" ).as_json[:product]
		render json: response
	end

	def update
		product = ProductsDAO.update_product( params[:user_id].to_i, product_params )
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
		response[:data] = ActiveModelSerializers::SerializableResource.new( product, include: "**" ).as_json[:product]
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

	def search
		if !params.has_key?( :q )
			message = Message.invalid_request( "q" )
			render json: { error: message }, status: 400
			return
		elsif !params.has_key?( :columns )
			message = Message.invalid_request( "columns" )
			render json: { error: message }, status: 400
			return
		elsif !params.has_key?( :user_id )
			message = Message.invalid_request( "user_id" )
			render json: { error: message }, status: 400
			return
		end

		query = params[:q].split( /,/ )
		genre_ids = []
		words = []
		columns = params[:columns].split( /,/ )
		i = 0
		filter_by_other_fields = false
		user_id = params[:user_id].to_i
		if columns.count > 0
			columns.each do |column|
				if column == "genre"
					genre_ids = query[i].split( / / ).map( &:to_i )
					i += 1
				else
					filter_by_other_fields = true
					words = query[i].split( / / )
				end
			end
		end

		results = []
		ids = []
		columns.each do |column|
			case column
				when "name"
					words.each do |word|
						products = Product.load_available_products_by_name( user_id, word, genre_ids )
						products.each do |product|
							if !ids.include?( product.id )
								results.push( product )
								ids.push( product.id )
							end
						end
					end
				when "author"
					words.each do |word|
						products = Product.load_available_products_by_author( user_id, word, genre_ids )
						products.each do |product|
							if !ids.include?( product.id )
								results.push( product )
								ids.push( product.id )
							end
						end
					end
				when "genre"
					if !filter_by_other_fields
						products = Product.load_available_products_by_genre_ids( user_id, genre_ids )
						products.each do |product|
							if !ids.include?( product.id )
								results.push( product )
								ids.push( product.id )
							end
						end
					end
				else
					message = Message.invalid_request_column( column )
					render json: { error: message }, status: 400
					return
			end
		end

		response = { count: results.count }

		results = results.paginate( page: params[:page], per_page: params[:per_page] )

		response[:data] = results.count > 0 ? ActiveModelSerializers::SerializableResource.new( results, include: "**" ).as_json[:products]: []
		render json: response
	end

	private

	def product_params
		params.require( :data ).permit( :id, :special, :available, :description, :cover, :status, :value, :code, :code_type, product_item: [:type, :id, :name, :author, :genre, :editorial, :year_of_publication] )
	end
end