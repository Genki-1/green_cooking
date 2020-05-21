Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#index'

  resources :makes, only: [:create, :destroy]

  resources :ingredients, only: [:create, :destroy]

  resources :recipes do

    collection do
      get 'search' => 'recipes#search', as: 'search'
    end

    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy, :index]
    resources :reports, only: [:create, :destroy, :new, :edit, :update]
  end

  resources :homes, only: [:index]

  resources :likes, only: [:create, :index, :destroy]

  get 'users/confirm' => 'users#confirm'
  patch 'users/hide' => 'users#hide'
  put 'users/hide' => 'users#hide'

  get 'users/following'
  get 'users/followers'
  get 'users/recipes'
  get 'users/likes'
  get 'users/reports'

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :following, :followers, :recipes, :likes, :reports
    end
  end
  resources :ralationships, only: [:create, :destroy]

  get 'homes/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
