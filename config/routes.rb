Rails.application.routes.draw do

  root to: 'items#index'

  resources :items do
    collection do
      patch :sort
    end
  end

  resources :parts, only: [:create, :destroy] do
    collection do
      patch :sort
    end
  end

  resources :glasses, only: [:create, :destroy] do
    collection do
      patch :sort
    end
  end

  resources :collections, only: [:create, :destroy] do
    collection do
      patch :sort
    end
  end

  resources :categories, only:  [:create, :destroy] do
    collection do
      patch :sort
    end
  end

  resources :materials, only:  [:create, :destroy] do
    collection do
      patch :sort
    end
  end
  
  resources :opal_colors, only: [:create, :destroy] do
    collection do
      patch :sort
    end
  end

end
