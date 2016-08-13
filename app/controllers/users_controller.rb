class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@inQueue = PodcastUser.where(user_id: @user.id, in_queue: true)
		@favorites = PodcastUser.where(user_id: @user.id, favorite: true)
    @inQueueGenres = @inQueue.map { |podcast_user| podcast_user.podcast.genre}.uniq
    @inQueuePodcasts = @inQueue.map { |pod_user| pod_user.podcast}
    if @user.id != current_user.id && Friend.where(user_id: @user.id, friend_id: current_user.id).count == 0
      @friend = Friend.new
      render '/friends/new'
    end

    @sorted_genres = genre_groups
  end

  private

    def genre_groups
      @inQueueGenres.collect do|genre|
        @inQueuePodcasts.select do |podcast|
          podcast.genre == genre
        end
      end
    end
end

# @comedy = @inQueuePodcasts.keep_if {|t| t.podcast.genre == "Comedy"}
# @music = @inQueuePodcasts.keep_if {|t| t.podcast.genre == "Music"}

# @inQueuePodcasts.chunk { |i| i.podcast.genre }

