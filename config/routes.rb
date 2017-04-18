Rails.application.routes.draw do
	scope "/api/v1" do
		post "login", to: "authentication#authenticate"
		resources :genres, only: [:index]
		resources :interests, only: [:index]
		resources :users, only: [:show, :create, :update, :destroy] do
			get "products", to: "products#collection"
			resources :products, only: [:create, :update, :destroy]
		end
		resources :products, only: [:index, :show] do
			resources :comments, only: [:create, :update, :destroy]
		end
	end
end