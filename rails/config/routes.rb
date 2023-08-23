# frozen_string_literal: true

Rails.application.routes.draw do
  mount KomachiHeartbeat::Engine => '/ops'

  root 'homes#show'

  namespace :admin do
    namespace :prefectures do
      resource :bulk, only: %i[new create]
    end
  end
end
