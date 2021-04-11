Rails.application.routes.draw do

  root to: 'items#index'
  resources :items
  resources :parts, only: [:create, :destroy]
  resources :glasses, only: [:create, :destroy]
  resources :collections, only: [:create, :destroy]
  resources :categories, only:  [:create, :destroy]
  resources :materials, only:  [:create, :destroy]
  resources :opal_colors, only: [:create, :destroy] do
    member do
      get :move_higher
      get :move_lower
    end
  end

end
