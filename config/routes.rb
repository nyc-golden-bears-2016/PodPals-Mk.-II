Rails.application.routes.draw do
  root 'podcasts#homepage'

  resources :podcasts do
  resources :discussions, shallow: true
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }


  # Discussions
  get '/podcasts/:podcast_id/discussions' => 'discussions#index'
  get '/podcasts/:podcast_id/discussions/new' => 'discussions#new'
  post '/podcasts/:podcast_id/discussions' => 'discussions#create'

  # Podcasts
  get '/podcasts/homepage' => 'podcasts#homepage'
  resources :users, only: :show
  resources :friends, only: :create
end
