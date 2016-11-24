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

  post '/cities/:id/rate/:feedback' => 'cities#submit_rating', :as => 'submit_rating'

  get '/cities/:id/:category' => 'cities#articles_category', :as =>  'city_articles_category'
  get '/articles/:id/:helpful' => 'articles#check_helpful', :as => 'check_helpful'

  get '/cities/:id' => 'cities#show', :as => 'city_show'


end
