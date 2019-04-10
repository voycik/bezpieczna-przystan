# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#index'
  get 'articles/index'
  get 'articles/new'
  get 'articles/create'
  get 'articles/edit'
  get 'articles/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
