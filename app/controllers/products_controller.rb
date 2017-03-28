class ProductsController < ApplicationController
	def index
		@products = Product.where( available: true )
		render json: { products: @products }
	end

	def show

	end

	def create
		user_id = params[:user_id]
		type = params[:type]
		if type == 0 # Book
			book = Book.new
			book.from_json( params[:book].to_json )
			if book.valid?
				render json: { product: book }
			else
				render json: { error: "Bad request. The object book was malformed", errors: book.errors }, status: 400
			end
		end
	end

	def update

	end
end