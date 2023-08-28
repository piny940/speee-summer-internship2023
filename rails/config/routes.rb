# frozen_string_literal: true

Rails.application.routes.draw do
  mount KomachiHeartbeat::Engine => '/ops'

  root 'homes#show'
  get '/assessments/success', to: 'assessments#success'

  resources :cities, only: %i[show]
  resources :branches, only: %i[show] do
    resources :assessments, only: %i[new create]
  end
  resources :sale_reviews, only: %i[show]
end
