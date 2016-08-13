Rails.application.routes.draw do
  root 'podcasts#index'

  resources :podcasts

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :users, only: :show
end
