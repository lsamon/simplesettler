# frozen_string_literal: true

namespace :admin do
  resources :users
  resources :cities
  resources :packages
  resources :visa_types do
    resources :visa_requirements
  end
  resources :payments, only: %i[index show]

  root to: 'cities#index'
end
