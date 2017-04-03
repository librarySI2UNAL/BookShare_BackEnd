class ApplicationController < ActionController::API
	#By using before_action, the server passes the request headers to AuthorizeApiRequest every time the user makes a request.
	#The request results are returned to the @current_user, thus becoming available to all controllers inheriting from ApplicationController.
	before_action :login_request
	    attr_reader :current_user
	
	private
	
	#To put the token to use, there must be a current_user method that will 'persist' the user.
	#In order to have current_user available to all controllers, it has to be declared in the ApplicationController
	def login_request
		@current_user = AuthorizeApiRequest.call(request.headers).result
		render json: { error: 'Not Authorized' }, status: 401 unless @current_user
	end
end