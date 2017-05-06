class User < ApplicationRecord
	has_secure_password

	belongs_to :city
	belongs_to :photo, optional: true
	has_and_belongs_to_many :interests

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
end
