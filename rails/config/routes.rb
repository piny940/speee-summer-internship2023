# frozen_string_literal: true

Rails.application.routes.draw do
  mount KomachiHeartbeat::Engine => '/ops'

  root 'homes#show'

  resources :branches, only: %i[show] do
    resources :assessments, only: %i[new create] do
      get :success, on: :collection
    end
  end
  resources :sale_reviews, only: %i[show]
  resources :cities, only: %i[show]
end
