Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root to: "super_users#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :super_users do
    member do
      post :reset_password
    end
  end

  resources :users, only: [:index] do
    collection do
      get :special
    end
  end
end
