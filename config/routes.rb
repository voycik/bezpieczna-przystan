# frozen_string_literal: true

Rails.application.routes.draw do
  
  devise_for :user, skip: :all
  devise_scope :user do
    get 'admin', to: 'devise/sessions#new'
    post 'admin', to: 'devise/sessions#create'
  end
  resources :animals, :articles
  root 'articles#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
