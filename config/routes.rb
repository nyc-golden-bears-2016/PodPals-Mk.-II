Rails.application.routes.draw do
  root 'podcasts#homepage'

  resources :podcasts do
    resources :discussions, shallow: true
  end
  
  resources :discussions do
    resources :comments, :only => [:create, :edit, :destroy]
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
  
  # Comments
  post '/discussions/:discussion_id/comments' => 'comments#create'
  # post '/discussions/:discussion_id/comments/:id/edit' => 'comments#edit'
  # post '/discussions/:discussion_id/comments/:id/' => 'comments#destroy'

  resources :users, only: :show
  
  resources :users do
    resources :friends
  end
end
