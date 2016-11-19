Rails.application.routes.draw do

  devise_for :users
  resources :jobs
  resources :myjobs
  root 'jobs#index'
  # devise_scope :user do
  #   root "devise/registrations#new"
  # end
end
