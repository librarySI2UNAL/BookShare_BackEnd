Rails.application.routes.draw do
	scope "/api/v1" do
		post "login", to: "users#login"
		resources :users, only: [:create, :update] do
			resources :products, only: [:index, :create, :update]
		end
		resources :products, only: [:index, :show]
	end
end