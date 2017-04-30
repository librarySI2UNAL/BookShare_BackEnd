class InterestsController < ApplicationController
	skip_before_action :authorize_request, only: :index

	def index
		interests = Interest.load_interests()
		render json: interests, root: "data"
	end
end