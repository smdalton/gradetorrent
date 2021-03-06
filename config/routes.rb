Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: "users/sessions",
      registrations: "users/registrations" }
  get '/courses', to: 'courses#index'

  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
end
