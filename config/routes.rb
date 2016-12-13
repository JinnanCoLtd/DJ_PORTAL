Rails.application.routes.draw do

  resources :listings

	root :to => 'pages#index'
	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations"}
	
	resources :users, only: [:show]
	
	resources :photographs, only: [:create, :destroy] do
		collection do
			get :list
		end
	end


	get 'manage-listing/:id/basics' => 'listings#basics', as: 'manage_listing_basics'
	get 'manage-listing/:id/photographs' => 'listings#photographs', as: 'manage_listing_photographs'
	get 'manage-listing/:id/calender' => 'listings#calender', as: 'manage_listing_calender'
	get 'manage-listing/:id/guarantee' => 'listings#guarantee', as: 'manage_listing_guarantee'
	get 'manage-listing/:id/contact' => 'listings#contact', as: 'manage_listing_contact'
	get 'manage-listing/:id/bankaccount' => 'listings#bankaccount', as: 'manage_listing_bankaccount'
	get 'manage-listing/:id/publish' => 'listings#publish', as: 'manage_listing_publish'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
