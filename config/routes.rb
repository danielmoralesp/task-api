Rails.application.routes.draw do
  resources :tasks, only: [:index, :create, :destroy]
end
