require 'sidekiq/web'
Rails.application.routes.draw do


  mount Ckeditor::Engine => '/ckeditor'
  mount Sidekiq::Web => '/sidekiq'

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

    root to: "articles#index"
  end

  namespace :dashboard do
    resources :visas, only:[:index]
    post '/visas/select_visa_type' => 'visas#select_visa_type'
    get '/visas' => 'visas#index'
    get '/visas/applicant_details' => 'visas#get_applicant_details'
    post '/visas/post_application_details' => 'visas#post_application_details'
    get '/visas/request_consultation' => 'visas#request_consultation'
    post '/visas/post_consulatation_request' => 'visas#post_consulatation_request'
    get '/visas/select_package' => 'visas#select_package'
    post '/visas/post_select_package' => 'visas#post_select_package'

    root to: "visas#index"
    resources :payments, only: [:new, :create]
    get '/payments/success' => 'payments#payment_success'
    get '/payments/error' => 'payments#payment_error'

    resources :faqs, only: [:index]
    resources :consultations, only: [:index, :create]
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", sessions: 'users/sessions' }
  as :user do
    get '/dashboard/profile' =>'users/sessions#profile'
    get '/dashboard/profile/edit' =>'users/sessions#edit'
    put '/dashboard/profile/edit' =>'users/sessions#update'
  end
  post '/articles/:id/:response' => 'helpfuls#create', as: :article_feedback

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

  resources :visa_types do
    resources :visa_requirements, except: [:show]
  end

end
