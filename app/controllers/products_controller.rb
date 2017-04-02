class ProductsController < ApplicationController
	def index
		products = Product.load_available_products( params[:page] )
		render json: { products: products }
		return
	end

	def show
		product = Product.load_product( params[:id] )
		render json: { product: product }
		return
	end

	def create
		if !params.has_key?( :type )
			render json: { error: "Bad request. The object type doesn't exist" }, status: 400
		end
=begin
		user_id = params[:user_id]
		user = User.find_by( id: user_id )
		if user == nil
			render json: { error: "User doesn't exist" }, status: 404
			return
		end
=end
		type = params[:type]
		if type == 0 # Book
			book = Book.new
			if !params.has_key?( :book )
				render json: { error: "Bad request. The object book doesn't exist" }, status: 400
				return
			end
			book.from_json( params[:book].to_json )
			if book.valid?
				book.save
				product = Product.new
				if !params.has_key?( :product )
					render json: { error: "Bad request. The object product doesn't exist" }, status: 400
					return
				end
				product.special = params[:product][:special]
				product.available = true
				product.product_item = book
				#product.user = user
				if product.valid?
					product.save
					render json: { product: product, book: book }
					return
				else
					render json: { errors: product.errors.full_messages }, status: 400
					return
				end
			else
				render json: { errors: book.errors.full_messages }, status: 400
				return
			end
		elsif type == 1 # Collection
			collection = Collection.new
			if !params.has_key?( :collection )
				render json: { error: "Bad request. The object collection doesn't exist" }, status: 400
				return
			end
			collection.from_json( params[:collection].to_json )
			if collection.valid?
				collection.save
				product = Product.new
				if !params.has_key?( :product )
					render json: { error: "Bad request. The object product doesn't exist" }, status: 400
					return
				end
				product.special = params[:product][:special]
				product.available = true
				product.product_item = collection
				#product.user = user
				if product.valid?
					product.save
					render json: { product: product, collection: collection }
					return
				else
					render json: { errors: product.errors.full_messages }, status: 400
					return
				end
			else
				render json: { errors: collection.errors.full_messages }, status: 400
				return
			end
		end
	end

	def update
		if !params.has_key?( :type )
			render json: { error: "Bad request. The object type doesn't exist" }, status: 400
		end
=begin
		user_id = params[:user_id]
		user = User.find_by( id: user_id )
		if user == nil
			render json: { error: "User doesn't exist" }, status: 404
			return
		end
=end
		type = params[:type]
		if type == 0 # Book
			if !params.has_key?( :book )
				render json: { error: "Bad request. The object book doesn't exist" }, status: 400
				return
			end
			book = Book.find_by( id = params[:book][:id] )
			book.from_json( params[:book].to_json )
			if book.valid?
				book.save
				if !params.has_key?( :product )
					render json: { error: "Bad request. The object product doesn't exist" }, status: 400
					return
				end
				product = Product.find_by( id = params[:product][:id] )
				product.special = params[:product][:special]
				product.available = params[:product][:available]
				product.product_item = book
				#product.user = user
				if product.valid?
					product.save
					render json: { product: product, book: book }
					return
				else
					render json: { errors: product.errors.full_messages }, status: 400
					return
				end
			else
				render json: { errors: book.errors.full_messages }, status: 400
				return
			end
		elsif type == 1 # Collection
			if !params.has_key?( :collection )
				render json: { error: "Bad request. The object collection doesn't exist" }, status: 400
				return
			end
			collection = Collection.find_by( id: params[:collection][:id] )
			collection.from_json( params[:collection].to_json )
			if collection.valid?
				collection.save
				if !params.has_key?( :product )
					render json: { error: "Bad request. The object product doesn't exist" }, status: 400
					return
				end
				product = Product.find_by( id = params[:product][:id] )
				product.special = params[:product][:special]
				product.available = true
				product.product_item = collection
				#product.user = user
				if product.valid?
					product.save
					render json: { product: product, collection: collection }
					return
				else
					render json: { errors: product.errors.full_messages }, status: 400
					return
				end
			else
				render json: { errors: collection.errors.full_messages }, status: 400
				return
			end
		end
	end
end