class AuthorizeApiRequest
	prepend SimpleCommand
	
	def initialize(headers = {})
		@headers = headers
	end
	
	def call
		user
	end
	
	private
	
	attr_reader :headers
	
	#user
	#Returns the user object
	def user
		#if User.find() returns an empty set, or decoded_auth_token returns false, @user will be nil
		@user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
		#the user method will either return the user or throw an error
		@user || errors.add(:token, 'Invalid token') && nil
	end
	
	#decoded_auth_token
	#decodes the token received from http_auth_header and retrieves the user's ID
	def decoded_auth_token
		@decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
	end
	
	#http_auth_header
	#extracts the token from the authorization header received in the initialization of the class
	def http_auth_header
		if headers['Authorization'].present?
			return headers['Authorization'].split(' ').last
		else
			errors.add(:token, 'Missing token')
		end
		nil
	end
end