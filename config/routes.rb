Rails.application.routes.draw do

   devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  mount Ckeditor::Engine => '/ckeditor'

  root :to => 'pages#index'
  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'
  get '/faq' => 'pages#faq'
  get '/tos' => 'pages#tos'
  get '/privacy_policy' => 'pages#privacy_policy'

  resources :cities, :except => [:show]
  resources :articles
  resources :categories

  get '/cities/:name/:category' => 'cities#articles_category', :as =>  'city_articles_category'
  get '/articles/:id/:helpful' => 'articles#check_helpful', :as => 'check_helpful'

  get '/cities/:name' => 'cities#show', :as => 'city_show'


end
