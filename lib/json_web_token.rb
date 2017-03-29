class JsonWebToken
    #singleton class
    class << self
        #encode method
        #purpose: authenticate the user and give him/her a token
        #inputs: user id, expiration time (defaults to 1 day), unique base key of your Rails application
        #output: token
        def encode(payload, exp = 24.hours.from_now)
            payload[:exp] = exp.to_i
            JWT.encode(payload, Rails.application.secrets.secret_key_base)
        end 
        #decode method
        #purpose: check if user's token is correct
        #inputs: token, unique base key of yout Rails application
        #outputs: validation, check whether the token is a valid one or not
        def decode(token)
            body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
            HashWithIndifferentAccess.new body
            rescue
            nil
        end
    end
end