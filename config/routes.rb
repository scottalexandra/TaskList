Rails.application.routes.draw do
  root "lists#index"
  resources :lists
  resources :tasks

  namespace :api do
    namespace :v1 do
      resources :lists
      resources :tasks
      resources :tags, only: [:show, :index, :create]
    end
  end
end
