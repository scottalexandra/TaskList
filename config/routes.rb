Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :lists
      resources :tasks
      resources :tags, only: [:show, :index, :create]
    end
  end
end
