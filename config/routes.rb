Rails.application.routes.draw do
  root :to => 'images#index'
  devise_for :users
  resources :images do
    resources :tags, except: :index
    resources :contents
  end
  resources :users, only: :show do
    resources :tags, except: :index
  end
  resources :contents, only: :index
end
