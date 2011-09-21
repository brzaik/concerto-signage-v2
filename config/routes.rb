ConcOrg2::Application.routes.draw do
  devise_for :users

  root :to => "frontpage#index"
	
  # named routes for major site pages:
  match "deploy", :to => "pages#show", :id => "deploy"
  match "demo", :to => "pages#show", :id => "demo"
  match "overview", :to => "pages#show", :id => "overview"
  match "why-concerto", :to => "pages#show", :id => "why-concerto"
  
  match "contact", :to => "contacts#new", :as => "contact"
	
  match "help", :to => "help_pages#index"
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

  # 301 Redirects for the old site
  match 'view/home', :to => redirect('/')
  match 'view/supporters', :to => redirect('/pages/supporters')
  match 'view/:slug', :to => redirect('/%{slug}')
end
