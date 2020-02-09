require 'sidekiq/web'
Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'

  post '/rate' => 'rater#create', :as => 'rate'

  namespace :admin do
    resources :users
    resources :articles
    resources :categories
    resources :cities
    resources :banners
    resources :packages
    resources :faqs
    resources :visa_types do
      resources :visa_requirements
    end
    resources :payments, only:[:index, :show]

    root to: 'articles#index'
  end

  namespace :dashboard do
    resources :visas, only: [:index]
    post '/visas/select_visa_type' => 'visas#select_visa_type'
    get '/visas' => 'visas#index'
    get '/visas/applicant_details' => 'visas#get_applicant_details'
    post '/visas/post_application_details' => 'visas#post_application_details'
    get '/visas/request_consultation' => 'visas#request_consultation'
    post '/visas/post_consulatation_request' => 'visas#post_consulatation_request'
    get '/visas/select_package' => 'visas#select_package'
    post '/visas/post_select_package' => 'visas#post_select_package'

    root to: 'visas#index'
    resources :payments, only: %i[new create]
    get '/payments/success' => 'payments#payment_success'
    get '/payments/error' => 'payments#payment_error'

    resources :faqs, only: [:index]
    resources :consultations, only: %i[index create]
  end

  devise_for :users, controllers: { sessions: 'users/sessions', confirmations: 'users/confirmations' }
  as :user do
    get '/dashboard/profile',      to: 'users/sessions#profile'
    get '/dashboard/profile/edit', to: 'users/sessions#edit'
    put '/dashboard/profile/edit', to: 'users/sessions#update'
  end

  root to: 'pages#index'
  get '/about' => 'pages#about'
  get '/help' => 'pages#help'
  get '/tos' => 'pages#tos'
  get '/privacy' => 'pages#privacy'
  get '/search' => 'pages#search'
  get '/subscribe' => 'pages#subscribe'
  get '/jobs' => 'pages#jobs'
  get '/webhook' => 'pages#webhook'

  devise_scope :user do
    get 'auth/facebook/callback',  to: 'users/sessions#create'
    get 'auth/failure',            to: redirect('/')
  end

  resources :cities do
    get '/chart' => 'highcharts#chart_data'
    resources :categories, only: %i[index show]
    resources :articles, only: [:show]
  end

  resources :visa_types do
    resources :visa_requirements, except: [:show]
  end

  resources :jobs, only: [:search] do
    get '/search' => 'jobs#search', on: :collection
  end

  namespace :facebook do
    resources :connect, only: [:create]
    resources :webhook, only: %i[index create]
  end
end
