Wtgsite::Application.routes.draw do |map|

  resources :contacts

	root :to => "frontpage#index"
	
	match "contact", :to => "contacts#new", :as => "contact"

	match "login", :to => "user_sessions#new", :as => "login"
	
	match "logout", :to => "user_sessions#destroy", :as => "logout"

  resources :blog_posts
  
  resources :blog_comments

  resources :user_sessions

  resources :projects
  
  resources :project_photos

  resources :users

  resources :pages

	match 'frontpage' => 'frontpage#index'
	
	match 'blog' => 'blog_posts#index'
	
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
