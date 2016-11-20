Rails.application.routes.draw do

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

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
