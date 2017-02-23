Rails.application.routes.draw do

  namespace :admin do
    resources :users
    resources :articles
    resources :categories
    resources :cities
    resources :city_articles
    resources :feedbacks
    resources :helpfuls

    root to: "users#index"
  end

   devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  mount Ckeditor::Engine => '/ckeditor'

  root :to => 'pages#index'
  get '/about' => 'pages#how_it_works'
  get '/inspiration' => 'pages#inspiration'
  get '/help' => 'pages#help'
  get '/tos' => 'pages#tos'
  get '/privacy' => 'pages#privacy'

  resources :cities do
    collection do
      get :autocomplete_city_name
    end
    resources :articles
  end

  get '/cities/:id/:category' => 'cities#articles_category', :as =>  'city_articles_category'
  get '/articles/:id/:helpful' => 'articles#check_helpful', :as => 'check_helpful'

end
