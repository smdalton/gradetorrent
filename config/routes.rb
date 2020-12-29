Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :assignments
      resources :user_courses
      resources :organizations
      resources :courses

      root to: "users#index"
    end
  devise_for :users, controllers: {
    sessions: "users/sessions",
      registrations: "users/registrations" }
  get 'static_pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
end
