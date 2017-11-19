Rails.application.routes.draw do

  root to: 'stories#index'

  resources :stories do
    resources :comments
  end
  resources :tags
  
end
