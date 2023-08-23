# frozen_string_literal: true

Rails.application.routes.draw do
  mount KomachiHeartbeat::Engine => '/ops'

  root 'homes#show'

  # この部分はさとしょーのIssue#14企業ページとコンフリクトする。適宜解決する。
  resources :branches, only: %i[show] do
    resource :assessments, only: %i[new]
  end
end
