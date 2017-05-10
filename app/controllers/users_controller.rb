class UsersController < ApplicationController
	skip_before_action :authorize_request, only: [:create, :validate_email]

	def validate_email
		if !params.has_key?( :email )
			message = Message.invalid_request( "email" )
			render json: { error: message }, status: 400
			return
		end
		exists = UsersDAO.validate_email( params[:email] )

		render json: { exists: exists }
	end

	def show
		if !params.has_key?( :id )
			message = Message.invalid_request( "id" )
			render json: { error: message }, status: 400
			return
		end

		user = User.load_user_by_id( params[:id].to_i )
		if user == nil
			message = Message.not_found( "User" )
			render json: { error: message }, status: 404
			return
		end

		render json: user, root: "data"
	end

	def create
		user = UsersDAO.create_user( user_params )
		if !user.valid?
			render json: { errors: user.errors.full_messages }, status: 400
			return
		end
		auth_token = AuthenticateUser.new( user.email, user.password ).call

		message = Message.object_created( "User" )
		response = { message: message, token: auth_token }
		response[:data] = ActiveModelSerializers::SerializableResource.new( user ).as_json[:user]
		render json: response
	end

	def update
		user = UsersDAO.update_user( params[:id].to_i, user_params )
		if !user.valid?
			render json: { errors: user.errors.full_messages }, status: 400
			return
		end

		message = Message.object_updated( "User" )
		response = { message: message }
		response[:data] = ActiveModelSerializers::SerializableResource.new( user ).as_json[:user]
		render json: response
	end

	def destroy
		deleted = UsersDAO.delete_user( params[:id].to_i )
		if !deleted
			message = Message.not_found( "User" )
			render json: { error: message }, status: 404
			return
		end

		message = Message.object_deleted( "User" )
		render json: { message: message }
	end

	def search
		#Search
		#TODO: Move queries to model
		users = User.all
		if params[:q]
			users = User.load_available_users_by_search( params[:page], params[:per_page], params[:q] )
		end
		if params[:sort]
			f = params[:sort].split(',')
			query = Array.new
			f.each do |field|
				if User.new.has_attribute?(field)
					column = f[0] == '-' ? f[1..-1] : f
					order = f[0] == '-' ? 'DESC' : 'ASC'
					query.push("#{column} #{order}")
				end
			end
			users = users.order(query.join(","))
		end
		if params[:select]
			f = params[:select].split(',')
			query = Array.new
			f.each do |column|
				if User.new.has_attribute?(column)
					query.push("#{column}")
				end
			end
			users = users.select(query.join(","))
		end
		render json: users, meta: pagination_meta(users)
		#TODO: Search-Oriented message
		message = Message.object_updated( "Results" )
		response = { message: message }
		#TODO: Serialize results array
		response[:results] = users.as_json
		render json: response
		########
	end

	def qsearch
		if !params.has_key?(:q) || !params.has_key?(:column)
			message = Message.invalid_request("q parameter or column")
			render json: {error: message}, status: 400
			return
		end
		q = params[:q].split(/ /)
		column_name = params[:column].split(/,/)
		results = []
		column_name.each do |the_col|
			puts "col = ", the_col
			case the_col
			when 'name'
					q.each do |word|
						puts "word = ", word
						u_name = User.load_users_by_name(1,10,word)
						if u_name.any? && !results.include?(u_name)
							results.push(u_name)
						end
					end
				when 'last_name'
					q.each do |word|
						puts "word = ", word
						u_name = User.load_users_by_name(1,10,word)
						if u_name.any? && !results.include?(u_name)
							results.push(u_name)
						end
					end

				else
					#message = Message.invalid_request("column")
					#render json: {error: message}, status: 400
			end
		end
		respond_to do |format|
			format.json { render json: { users: results }}
		end
	end

	private

	def user_params
		params.require( :data ).permit( :name, :last_name, :email, :password, :qualification, :latitude, :longitude, :photo, interests: [] )
	end

end
