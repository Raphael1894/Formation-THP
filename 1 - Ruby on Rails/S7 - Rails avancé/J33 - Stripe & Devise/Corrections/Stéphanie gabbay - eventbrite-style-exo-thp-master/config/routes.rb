Rails.application.routes.draw do
  get 'static_pages/index'
  get 'static_pages/secret'
  devise_for :users
  root to: "static_pages#index"
  #root to:events#index
  resources :users
  resources :attendances
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
