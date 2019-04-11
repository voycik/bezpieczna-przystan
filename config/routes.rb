# frozen_string_literal: true

Rails.application.routes.draw do
  get 'animals/index'
  get 'animals/show'
  get 'animals/new'
  get 'animals/create'
  get 'animals/destroy'
  root 'articles#index'
  get 'articles/index'
  get 'articles/new'
  get 'articles/create'
  get 'articles/edit'
  get 'articles/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
