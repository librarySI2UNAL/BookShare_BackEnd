Rails.application.routes.draw do
	scope "/api/v1" do
		post "login", to: "authentication#authenticate"
		resources :users, only: [:show, :create, :update, :destroy] do
			resources :products, only: [:index, :create, :update, :destroy]
		end
		resources :products, only: [:index, :show] do
			resources :comments, only: [:index, :create, :update, :destroy]
		end
	end
end
