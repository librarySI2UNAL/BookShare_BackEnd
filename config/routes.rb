Rails.application.routes.draw do
	scope "/api/v1" do
		post "login", to: "authentication#authenticate"
		post "logout", to: "authentication#destroy"
		resources :genres, only: [:index]
		resources :interests, only: [:index]
		get "users/validate", to: "users#validate_email"
		get "search", to: "users#q_search"


		resources :users, only: [:index, :show, :create, :update, :destroy, :q_search] do

			get "products", to: "products#collection"
			resources :products, only: [:create, :update, :destroy]
			delete "photos", to: "photos#destroy_collection"
			resources :photos, only: [:create, :update, :destroy]

		end

		resources :products, only: [:index, :show, :q_search] do
			resources :comments, only: [:create, :update, :destroy, :q_search]
			get "search", to: "products#q_search"
			delete "photos", to: "photos#destroy_collection"
			resources :photos, only: [:create, :update, :destroy]
		end

	end
end

#params[:q]
