Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :lists
      resources :tasks
    end
  end
end
