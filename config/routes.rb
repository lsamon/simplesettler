Rails.application.routes.draw do

  get 'categories/index'

  get 'categories/show'

  get 'categories/new'

  get 'categories/edit'

  get 'categories/update'

  get 'categories/create'

  get 'categories/destroy'

  get 'articles/index'

  get 'articles/show'

  get 'articles/new'

  get 'articles/edit'

  get 'articles/update'

  get 'articles/create'

  get 'articles/destroy'

  get 'cities/index'

  get 'cities/show'

  get 'cities/new'

  get 'cities/edit'

  get 'cities/update'

  get 'cities/create'

  get 'cities/destroy'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

  get 'users/update'

  get 'users/create'

  get 'users/destroy'

  mount Ckeditor::Engine => '/ckeditor'
  root :to => 'pages#index'
  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'
  get '/faq' => 'pages#faq'
  get '/tos' => 'pages#tos'
  get '/privacy_policy' => 'pages#privacy_policy'

  resources :users
  resources :cities
  resources :articles
  resources :categories
end
