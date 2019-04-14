# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admin', to: 'devise/sessions#new'
  end
  resources :animals, :articles
  root 'articles#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
