Rails.application.routes.draw do
  root 'podcasts#index'

  resources :podcasts do
  resources :discussions, shallow: true
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }


end
