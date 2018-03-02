Rails.application.routes.draw do
  get 'users/show'

	get 'users/new'

	get 'sessions/new'

	get 'welcome/articles'
	root 'welcome#index'
	resources :articles do
		resources :comments
	end

	get "home" => "welcome#index"
	get     "login"    => "sessions#new"
	post "login" => "sessions#create"
	delete  "logout"   => "sessions#destroy"
	delete 'articles/destroy'
	resources :users
	# post '/login' to 'sessions#create'
	# delete '/login' to 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
