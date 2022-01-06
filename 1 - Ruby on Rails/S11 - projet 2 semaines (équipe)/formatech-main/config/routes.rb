# frozen_string_literal: true

Rails.application.routes.draw do
  resources :fields
  resources :tags
  root 'static_pages#index'
  resources :comments

  resources :favorites

  resources :courses do
    member do
      put 'like' => 'courses#vote'
    end
    resources :pictures, only: %i[create update]
  end

  devise_for :instructors

  resources :instructors do
    resources :logos, only: %i[create update]
  end

  devise_for :users

  # resources :instructors, :path => '/:nickname' do
  #   resources :logos, :only =>[:create, :update]
  # end

  resources :users do
    resources :avatars, only: %i[create update]
  end

  resources :instructor_carts
  resources :instructor_orders

  resources :charges, only: %i[new create destroy]
  scope '/charges' do
    get 'cancel', to: 'charges#cancel', as: 'charges_cancel'
    get 'success', to: 'charges#success', as: 'charges_success'
  end

  # resources :users, :except => [:show] do
  #   resources :avatars, :only =>[:create, :update]
  # end

  # resources :users, only: :show, param: :slug do
  #   resources :avatars, :only =>[:create, :update]
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
