Rails.application.routes.draw do
	scope "/api/v1" do

		post "login", to: "authentication#authenticate"
		get "users/validate", to: "users#validate_email"
		get "products/search", to: "products#search"
		get "products/specials", to: "products#special_collection"

		resources :genres, only: [:index]
		resources :interests, only: [:index]

		resources :users, only: [:index, :show, :create, :update, :destroy] do
			get "products", to: "products#collection"
			get "near", to: "users#near_users"

			resources :products, only: [:create, :update, :destroy] do
				get "validate", to: "products#validate"
			end
			resources :photos, only: [:create, :update, :destroy]
		end

		resources :products, only: [:index, :show] do
			resources :comments, only: [:create, :update, :destroy]
			resources :photos, only: [:create, :update, :destroy]
		end
	end
end
