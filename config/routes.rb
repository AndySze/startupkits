Startupkit::Application.routes.draw do



  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"

  devise_for :users
  resources :users do
    resources :projects
    resources :ideas do
      resources :customer_segments
      resources :problems
      resources :metrics
      resources :channels
      resources :advantages
      resources :uvps
      resources :solutions
    end
  end
end
