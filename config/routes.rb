Rails.application.routes.draw do
  root 'podcasts#homepage'

  #Genres
  get '/podcasts/genres' => 'podcasts#genres'
  get '/podcasts/genres/:name' => 'podcasts#list'

  resources :podcasts do
    resources :discussions, shallow: true
  end

  resources :discussions do
    resources :comments, :only => [:create]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }


  # Discussions
  get '/podcasts/:podcast_id/discussions/new' => 'discussions#new'
  post '/podcasts/:podcast_id/discussions' => 'discussions#create'

  # Podcasts
  get '/podcasts/homepage' => 'podcasts#homepage'

  # Comments
  post '/discussions/:discussion_id/comments' => 'comments#create'


  resources :comments
  resources :users, only: :show
  resources :friends, only: :create
end
