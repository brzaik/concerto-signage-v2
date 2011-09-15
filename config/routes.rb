ConcOrg2::Application.routes.draw do
  root :to => "frontpage#index"
	
	# named routes for major site pages:
	match "deploy", :to => "pages#show", :id => "deploy"
	match "demo", :to => "pages#show", :id => "demo"
	match "overview", :to => "pages#show", :id => "overview"
	match "why-concerto", :to => "pages#show", :id => "why-concerto"
	
	# named routes for auth:
	match "contact", :to => "contacts#new", :as => "contact"
	match "login", :to => "user_sessions#new", :as => "login"
	match "logout", :to => "user_sessions#destroy", :as => "logout"
	match "register", :to => "users#new", :as => "signup"
	
	match "help_pages/send_email", :to => "help_pages#send_email"  
  resources :help_pages do
    collection do
      get :search
      post :search
    end
  end

  resources :categories
  
	resources :contacts
	
	resources :blocks do
	  member do
	    get :move_block_higher
	    get :move_block_lower
	  end
	end
	
	resources :columns do
	  resources :blocks
	  
	  member do
	    get :move_column_higher
	    get :move_column_lower
	  end
	end

  resources :user_sessions

  resources :users

  resources :pages do
    resources :columns
  end

  match 'frontpage' => 'frontpage#index'

end
