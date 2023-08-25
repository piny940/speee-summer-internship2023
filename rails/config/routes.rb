# frozen_string_literal: true

Rails.application.routes.draw do
  mount KomachiHeartbeat::Engine => '/ops'

  root 'homes#show'
  resources :branches, only: [:show]  # 企業ページ
end
