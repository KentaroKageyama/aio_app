Rails.application.routes.draw do

  devise_for :users
  root to: 'users#index'

  resources :users, only: [:index]

  resources :items do
    collection do
      get :search
      get :new_other
      get :incremental_search
      patch :sort
      get :output_price
    end
  end

  resources :parts, only: [:new, :edit, :update, :create, :destroy] do
    collection do
      patch :sort
    end
  end

  resources :glasses, only: [:new, :create, :destroy] do
    collection do
      patch :sort
    end
  end

  resources :collections, only: [:create, :edit, :update, :destroy] do
    collection do
      patch :sort
    end
  end

  resources :categories, only:  [:create, :edit, :update, :destroy] do
    collection do
      patch :sort
    end
  end

  resources :materials, only:  [:create, :edit, :update, :destroy] do
    collection do
      patch :sort
    end
  end

  resources :opal_colors, only: [:create, :edit, :update, :destroy] do
    collection do
      patch :sort
    end
  end

  resources :post_pdf, only: :index
  resources :invoices, only: [:index, :new, :create, :update, :destroy]
  resources :clients, only: [:index, :create, :update, :destroy]
end
