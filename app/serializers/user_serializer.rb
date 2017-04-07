class UserSerializer < ActiveModelSerializers::Model
	attributes :id, :name, :last_name, :email, :password
end
