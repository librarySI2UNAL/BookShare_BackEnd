class GenresController < ApplicationController
	def index
		genres = Genre.load_genres()
		render json: genres, root: "data"
	end
end