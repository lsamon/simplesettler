Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
    resources :users
    resources :articles
    resources :categories
    resources :cities
    resources :banners
    resources :visa_types do
      resources :visa_requirements
    end

    root to: "articles#index"
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", sessions: 'users/sessions' }
  post '/articles/:id/:response' => 'helpfuls#create', as: :article_feedback

  post 'help_steps' => 'helpfuls#ajax_steps'
  post 'select_visa_type' => 'helpfuls#select_visa_type'

  root :to => 'pages#index'
  get '/about' => 'pages#how_it_works'
  get '/inspiration' => 'pages#inspiration'
  get '/help' => 'pages#help'
  get '/tos' => 'pages#tos'
  get '/privacy' => 'pages#privacy'

  get '/applicant_details' => 'helpfuls#get_applicant_details'
  get '/get_additional_details' => 'helpfuls#get_additional_details'
  post '/post_application_details' => 'helpfuls#post_application_details'

  resources :cities do
    collection do
      get :autocomplete_city_name
    end
    resources :categories, only: [:index, :show]
    resources :articles, only: [:show]
  end

  resources :visa_types do
    resources :visa_requirements
  end

end
