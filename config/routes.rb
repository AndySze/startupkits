Startupkit::Application.routes.draw do


  resources :customer_segments


  resources :ideas


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users do
    resources :projects
    resources :ideas do
      resources :customer_segments
    end
  end
end
