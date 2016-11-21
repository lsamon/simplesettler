Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root :to => 'pages#index'
  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'
  get '/faq' => 'pages#faq'
  get '/tos' => 'pages#tos'
  get '/privacy_policy' => 'pages#privacy_policy'

  get '/cities/:name' => 'cities#show'
  get '/cities/:name/:category' => 'cities#articles_category', :as => 'city_articles_category', :defaults => {:format => 'js'}

  resources :users
  resources :cities, :except => [:show]
  resources :articles
  resources :categories

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
