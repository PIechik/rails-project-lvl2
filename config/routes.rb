# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts do
    scope module: :posts do
      post 'comments', to: 'comments#create'
      post 'likes', to: 'likes#create'
      delete 'likes', to: 'likes#destroy'
    end
  end
end
