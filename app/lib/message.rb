class Message
	def self.invalid_request( parameter = "parameter" )
		"Bad request. The #{parameter} parameter doesn't exist"
	end

	def self.not_found( record = "Record" )
		"#{record} not found"
	end

	def self.invalid_credentials
		"Invalid credentials"
	end

	def self.invalid_token
		"Invalid token"
	end

	def self.missing_token
		"Missing token"
	end

	def self.unauthorized
		"Unauthorized request"
	end

	def self.object_created( record = "Record" )
		"#{record} created successfully"
	end

	def self.object_updated( record = "Record" )
		"#{record} updated successfully"
	end

	def self.account_not_created
		"Account could not be created"
	end

	def self.expired_token
		"Your token has expired"
	end
end