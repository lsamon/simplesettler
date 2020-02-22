# frozen_string_literal: true

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

  resources :consultations, only: %i[index create]
end
