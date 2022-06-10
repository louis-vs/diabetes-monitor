# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  root 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'cookies', to: 'welcome#cookies'
  get 'terms', to: 'welcome#terms'
  get 'shared_entries', to: 'shared_entries#index'

  resources :entries do
    get 'blank', on: :new
    get 'group', on: :collection
  end
  get 'entries/day/:date', to: 'entries#show_day', as: :entries_day

  resources :share_tokens, only: %i[index create update destroy]
end
