# frozen_string_literal: true

require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  draw :admin
  draw :dashboard

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

  devise_scope :user do
    get 'auth/facebook/callback',  to: 'users/sessions#create'
    get 'auth/failure',            to: redirect('/')
  end

  resources :cities

  resources :visa_types do
    resources :visa_requirements, except: [:show]
  end

  resources :jobs, only: [:search] do
    get '/search' => 'jobs#search', on: :collection
  end
end
