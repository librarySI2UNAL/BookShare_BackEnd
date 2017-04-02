class AuthenticateUser
    prepend SimpleCommand
    
    #this is where parameters are taken when the command is called
    def initialize(email, password)
        @email = email
        @password = password
    end
    
    #this is where the result gets returned
    def call
        JsonWebToken.encode(user_id: user.id) if user
    end
    
    private
    
    attr_acessor :email, :password
    
    def user
       Users.find_by_email(email) 
       return user if user && user.authenticate(password)
       
       errors.add :user_authentication, 'invalid username or password'
       nil
    end
end