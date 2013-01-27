Startupkit::Application.routes.draw do



  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"
  get "about-startup-toolkits" => "home#about"

  get "i/:key" => "ideas#show",:as => :i


  resources :ideas do
    resources :customer_segments, :only => [:destroy, :create]
    resources :problems, :only => [:destroy, :create]
    resources :metrics, :only => [:destroy, :create]
    resources :channels, :only => [:destroy, :create]
    resources :advantages, :only => [:destroy, :create]
    resources :uvps, :only => [:destroy, :create]
    resources :solutions, :only => [:destroy, :create]
    resources :structures, :only => [:destroy, :create]
    resources :revenues, :only => [:destroy, :create]

    put :add_user, :on => :member
    put :delete_user, :on => :member
  end

  devise_for :users
  resources :users do
    resources :projects
  end
end
