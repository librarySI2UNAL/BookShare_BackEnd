class User < ApplicationRecord
	attr_accessor :name, :lastName, :email, :city, :qualification
	belongs_to :photo
end
