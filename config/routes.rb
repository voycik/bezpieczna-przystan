# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user, skip: :all
  devise_scope :user do
    get 'admin', to: 'devise/sessions#new'
    post 'admin', to: 'devise/sessions#create'
  end
  resources :animals, except: %i[adoption send_adoption_form]
  resources :articles
  root 'articles#index'
  get 'contact-me', to: 'messages#new', as: 'new_message'
  post 'contact-me', to: 'messages#create', as: 'create_message'
  get 'adopt', to: 'animals#adoption', as: 'adoption'
  post 'adopt', to: 'animals#send_adoption_form', as: 'send_adoption_form'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
