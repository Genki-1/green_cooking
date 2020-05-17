Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#index'

  resources :makes, only: [:create, :destroy]

  resources :ingredients, only: [:create, :destroy]

  resources :recipes, only: [:create, :index, :destroy, :new, :show, :edit, :update] do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy, :index]
  end

  resources :homes, only: [:index]

  resources :reports, only: [:create, :index, :destroy, :new, :edit, :update]

  resources :likes, only: [:create, :index, :destroy]

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :following, :followers, :recipes, :likes
    end
  end
  resources :ralationships, only: [:create, :destroy]

  get 'users/confirm'
  get 'users/hide'
  get 'users/following'
  get 'users/followers'
  get 'users/recipes'
  get 'users/likes'


  get 'homes/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

