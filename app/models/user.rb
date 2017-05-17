class User < ApplicationRecord
	has_secure_password

	belongs_to :city
	belongs_to :photo, optional: true
	has_and_belongs_to_many :interests
	has_many :products

	validates :name, presence: true
	validates :last_name, presence: true
	validates :password_digest, presence: true
	validates :email, presence: true, uniqueness: true, format: Devise::email_regexp
	validates :qualification, presence: true

	def self.load_user_by_email( email )
		self.find_by_email( email )
	end

	def self.load_user_by_id( id )
		self.find_by_id( id )
	end

	def self.exists_user_with_email( email )
		self.exists?( email: email )
	end
	
	def self.load_near_users( user, distance = 1 )
		users = []
		self.joins( :products ).where( products: { available: true } )
			.distinct.where.not( id: user.id ).each do |user_query|
			if user.calculate_distance( user_query.latitude, user_query.longitude ) <= distance
				users.push( user_query )
			end
		end

		return users
	end
	
	def calculate_distance( latitude, longitude )
		latitude1 = self.latitude
		longitude1 = self.longitude
		diffLat = ( latitude1 - latitude ) * Math::PI / 180
		diffLng = ( longitude1 - longitude) * Math::PI / 180
		x = Math.sin( diffLat * 0.5 ) * Math.sin( diffLat * 0.5 ) + Math.cos( latitude * Math::PI / 180 ) * Math.cos( latitude1 * Math::PI / 180 ) * Math.sin( diffLng * 0.5 ) * Math.sin( diffLng * 0.5 )
		return 6371 * ( 2 * Math.atan2( Math.sqrt(x), Math.sqrt( 1 - x ) ) )
	end
end