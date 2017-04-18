Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
    resources :users
    resources :articles
    resources :categories
    resources :cities
    root to: "articles#index"
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", sessions: 'users/sessions' }
  post '/articles/:id/:response' => 'helpfuls#create', as: :article_feedback

  post 'help_steps' => 'helpfuls#ajax_steps'

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
    resources :categories, only: [:index, :show]
    resources :articles, only: [:show]
  end

end
