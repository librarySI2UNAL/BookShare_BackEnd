Rails.application.routes.draw do
	scope "/api/v1" do
		resources :login, only: [:index]
		resources :users, only: [:create, :update] do
			resources :products, only: [:create, :update]
		end
		resources :products, only: [:index, :show]
	end
end