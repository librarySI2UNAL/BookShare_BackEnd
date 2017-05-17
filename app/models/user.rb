class User < ApplicationRecord
	has_secure_password

	belongs_to :city
	belongs_to :photo, optional: true
	has_and_belongs_to_many :interests
	has_many :product, :inverse_of => :user

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

	def self.load_users_by_name( page = 1, per_page = 10, name = "" )
		ans = []
		users = self.all
		users.each do |user|
			if user.name.downcase.include?( name.downcase )
				ans.push(user)
			end
			if user.last_name.downcase.include?( name.downcase )
				ans.push(user)
			end
		end
		ans.paginate( page: page, per_page: per_page )
	end


	def self.exists_user_with_email( email )
		self.exists?( email: email )
	end

	def self.load_available_users_by_search( page = 1, per_page = 10, query = "" )
		result = self.all
		result = result.where(["name = ?", query]).or(result.where(["last_name = ?", query])).or(result.where(["email = ?", query]))

		result.paginate( page: page, per_page: per_page )
	end
	
	def self.load_near_users(user_id, latitude, longitude, distance)
		#users = User.where.not(id: user_id)
		#users = User.where.not(id: user_id).joins(:product).where(:product => { :available => 'true' })
		users = self.joins(:product).where(products: { available: true }).where.not(users: {id: user_id})
		#users.delete_if {|user| user.calculate_distance(latitude, longitude) > distance}
		result = []
		users.each do |user|
			if user.calculate_distance(latitude, longitude) <= distance.to_f
				result.push(user)
			end
		end
		return result
	end
	
	def self.get_products_for_user_id(user_id)
		return Product.joins(:user).where(products: { available: true }, users: {id: user_id})
	end
	
	def calculate_distance(latitude, longitude)
		latitude1 = self.latitude
		longitude1 = self.longitude
		diffLat = (latitude1-latitude) * Math::PI / 180
		diffLng = (longitude1-longitude) * Math::PI / 180
		x = Math.sin(diffLat * 0.5) * Math.sin( diffLat * 0.5) + Math.cos(latitude * Math::PI / 180) * Math.cos(latitude1 * Math::PI / 180) * Math.sin(diffLng * 0.5) * Math.sin(diffLng * 0.5)
		return 6371 * ( 2 * Math.atan2(Math.sqrt(x), Math.sqrt(1-x)))
	end
end
