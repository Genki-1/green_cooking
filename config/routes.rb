Rails.application.routes.draw do

  devise_for :users

  get 'homes/index'
  get 'homes/about'

  get 'ralationships/create'
  get 'ralationships/destroy'

  get 'reports/index'
  get 'reports/new'
  get 'reports/create'
  get 'reports/destroy'
  get 'reports/edit'
  get 'reports/update'

  get 'comments/create'
  get 'comments/destroy'

  get 'likes/index'
  get 'likes/create'
  get 'likes/destroy'

  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/new'
  get 'recipes/create'
  get 'recipes/edit'
  get 'recipes/update'

  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/confirm'
  get 'users/hide'
  get 'users/following'
  get 'users/followers'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

