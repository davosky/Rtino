Rails.application.routes.draw do
  resources :tasks
  resources :projects do
    collection do
      get :completed
    end
  end
  resources :project_statuses
  resources :project_typologies
  resources :transfers
  resources :transports
  resources :assistances
  resources :offices
  resources :categories
  resources :reports do
    collection do
      get :pdfprint
      get :pdfprintreport
    end
  end
  resources :structures
  resources :locations
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users
  root to: "home#index"
  get "home/index"
  get "home/howto"
  get "home/about"
  get "home/credits"
end
