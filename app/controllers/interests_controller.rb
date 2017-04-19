class InterestsController < ApplicationController
	def index
		interests = Interest.load_interests()
		render json: interests
	end
end