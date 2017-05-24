Rails.application.routes.draw do

  namespace :admin do
    resources :packages
  end
  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
    resources :users
    resources :articles
    resources :categories
    resources :cities
    resources :visa_types do
      resources :visa_requirements
    end
    resources :payments, only:[:index, :show]

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

  # get '/applicant_details' => 'helpfuls#get_applicant_details'
  # get '/get_additional_details' => 'helpfuls#get_additional_details'
  # post '/post_application_details' => 'helpfuls#post_application_details'
  # post '/post_additional_details' => 'helpfuls#post_additional_details'


  post '/dashboard/select_visa_type' => 'dashboard#select_visa_type'
  get '/dashboard' => 'dashboard#index'
  get '/dashboard/applicant_details' => 'dashboard#get_applicant_details'
  get '/dashboard/get_additional_details' => 'dashboard#get_additional_details'
  post '/dashboard/post_application_details' => 'dashboard#post_application_details'
  post '/dashboard/post_additional_details' => 'dashboard#post_additional_details'
  get '/dashboard/request_consultation' => 'dashboard#request_consultation'
  post '/dashboard/post_consulatation_request' => 'dashboard#post_consulatation_request'

  resources :cities do
    collection do
      get :autocomplete_city_name
    end
    resources :categories, only: [:index, :show]
    resources :articles, only: [:show]
  end

  resources :payments, only: [:new, :create]
  get '/payments/success' => 'payments#payment_success'
  get '/payments/error' => 'payments#payment_error'

  resources :visa_types do
    resources :visa_requirements
  end

end
