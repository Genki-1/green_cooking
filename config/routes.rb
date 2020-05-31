Rails.application.routes.draw do

  devise_for :users,controllers:{
    sessions: 'users/sessions'
  }

  root to: 'homes#index'

  resources :makes, only: [:create, :destroy]

  resources :ingredients, only: [:create, :destroy]

  resources :recipes do

    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    resources :reports, only: [:create, :destroy]
  end

  resources :homes, only: [:index]

  resources :likes, only: [:create, :destroy]

  get 'users/confirm' => 'users#confirm'
  patch 'users/hide' => 'users#hide'
  put 'users/hide' => 'users#hide'

  get 'users/following'
  get 'users/followers'
  get 'users/recipes'
  get 'users/likes'
  get 'users/reports'

  resources :users, only: [:show, :edit, :update] do
    member do
      get :following, :followers, :recipes, :likes, :reports
    end
  end
  resources :ralationships, only: [:create, :destroy]

  get 'homes/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end