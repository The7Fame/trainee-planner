# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/, defaults: { locale: I18n.default_locale } do
    root 'home#index'
    devise_for :users, path: '', controllers: { registrations: 'users/registrations' }
    resources :categories
    resources :events
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
