class User < ApplicationRecord
	attr_accessor :name, :last_name, :email, :city, :qualification
	belongs_to :photo
end
