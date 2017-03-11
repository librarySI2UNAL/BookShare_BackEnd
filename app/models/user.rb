class User < ApplicationRecord
	attr_accessor :name, :last_name, :email, :qualification
	belongs_to :photo, :city
end
