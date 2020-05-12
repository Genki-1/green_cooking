Rails.application.routes.draw do

  devise_for :users

  root to: 'recipes#index'

  resources :makes, only: [:create, :destroy]

  resources :ingredients, only: [:create, :destroy]

  resources :recipes, only: [:create, :index, :destroy, :new, :show, :edit, :update]

  resources :homes, only: [:index]

  resources :ralationships, only: [:create, :destroy]

  resources :reports, only: [:create, :index, :destroy, :new, :edit, :update]

  resources :comments, only: [:create, :destroy]

  resources :likes, only: [:create, :index, :destroy]

  resources :users, only: [:index, :show, :edit, :update]

  get 'users/confirm'
  get 'users/hide'
  get 'users/following'
  get 'users/followers'

  get 'homes/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

