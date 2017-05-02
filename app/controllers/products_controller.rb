# encoding: utf-8
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

	def search
		products = Product.all
		if params['search']
			products = Product.load_available_products_by_search( params[:page], params[:per_page], params[:search] )
		end
	    if params['sort']
	      f = params['sort'].split(',').first
	      field = f[0] == '-' ? f[1..-1] : f
	      order = f[0] == '-' ? 'DESC' : 'ASC'
	      if Product.new.has_attribute?(field)
	        products = products.order("#{field} #{order}")
	      end
	    end
	    if params['select']
	    	products = products.select(params['select'])
	    end
	    render json: products, meta: pagination_meta(products)
	end

def q_search
	if !params.has_key?(:q) || !params.has_key?(:column)
		message = Message.invalid_request("q parameter or column")
		render json: {error: message}, status: 400
		return
	end

	q = params[:q].split("+")
	column_name = params[:column]
	results = []

	case column_name
	when 'name'
		q.each do |word|
			p_name = Product.load_available_products_by_name(1,10,word)
			if p_name.any? && !results.include?(p_name)
				results.push(p_name)
			end
		end

		render json: results, status: 200
		return

	when 'genre'
		q.each do |word|
			p_genre = Product.load_available_products_by_genre(1, 10, word)
			if p_genre.any? && !results.includ?(p_genre)
				results.push(p_genre)
			end
		end

		render json: results, status: 200
		return

		when 'author'
			q.each do |word|
				p_author = Product.load_available_products_by_author(1,10,word)
				if p_author.any? && !results.include?(p_author)
					results.push(p_author)
				end
			end

			render json: results, status: 200
			return

		else
			render json: results
		end

	end



end
