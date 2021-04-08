# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  root 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'shared_entries', to: 'shared_entries#index'

  resources :entries, only: %i[index create edit update destroy]
  resources :share_tokens, only: %i[index create update destroy]
end
