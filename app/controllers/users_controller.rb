class UsersController < ApplicationController
	def show
    @user = User.find(params[:id])
		@inQueue = PodcastUser.where(user_id: @user.id, in_queue: true)
    @inQueueGenres = @inQueue.map { |podcast_user| podcast_user.podcast.genre}.uniq
    @inQueuePodcasts = @inQueue.map { |pod_user| pod_user.podcast}
		@favorites = PodcastUser.where(user_id: @user.id, favorite: true)
    @favoriteGenres = @favorites.map { |podcast_user| podcast_user.podcast.genre}.uniq
    @favoritePodcasts = @favorites.map { |pod_user| pod_user.podcast}
    @sorted_queue_genres = queue_genre_groups
    @sorted_favorite_genres = favorite_genre_groups
  end

  private

    def queue_genre_groups
      @inQueueGenres.collect do|genre|
        @inQueuePodcasts.select do |podcast|
          podcast.genre == genre
        end
      end
    end

    def favorite_genre_groups
      @favoriteGenres.collect do|genre|
        @favoritePodcasts.select do |podcast|
          podcast.genre == genre
        end
      end
    end
end

