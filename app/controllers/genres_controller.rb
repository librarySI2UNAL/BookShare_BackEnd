class GenresController < ApplicationController
	def index
		genres = Genre.load_genres()
		render json: genres
	end
end