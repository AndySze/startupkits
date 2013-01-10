Startupkit::Application.routes.draw do


  resources :ideas


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users do
    resources :projects
    resources :ideas
  end
end
