Rails.application.routes.draw do

  devise_for :users
  root to: 'stories#index'

  resources :stories do
    resources :comments
  end
  resources :tags
  
end
