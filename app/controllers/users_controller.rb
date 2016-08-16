class UsersController < ApplicationController
	def show
    @user = User.find(params[:id])
		@inQueue = PodcastUser.where(user_id: @user.id, in_queue: true)
    @inQueueGenres = @inQueue.map { |podcast_user| podcast_user.podcast.genre}.uniq
    @inQueuePodcasts = @inQueue.map { |pod_user| pod_user.podcast}
    @inQueueTitles = @inQueuePodcasts.map {|podcast| podcast.title}
		@favorites = PodcastUser.where(user_id: @user.id, favorite: true)
    @favoriteGenres = @favorites.map { |podcast_user| podcast_user.podcast.genre}.uniq
    @favoritePodcasts = @favorites.map { |pod_user| pod_user.podcast}
    @favoriteTitles = @favoritePodcasts.map {|podcast| podcast.title}

    @sorted_queue_genres = queue_genre_groups
    @sorted_favorite_genres = favorite_genre_groups
    @category_ids = [['Arts', '1301'],['Comedy','1303'],['Education','1304'],['Kids & Family','1305'],['Health','1307'],['TV & Film','1309'],['Music','1310'],['News & Politics','1311'],['Religion & Spirituality', '1314'],['Science & Medicine', '1315'],['Technology', '1318'],['Business', '1321'],['Games & Hobbies', '1323'],['Society & Culture', '1324'],['Government & Organizations', '1325'], ['Places & Travel','1320'], ['Food','1306'], ['Literature', '1401'], ['Shopping', '1472'], ['Investing', '1412']]
    @category_hash = @category_ids.to_h
    @suggestions = (@favoriteGenres.map {|genre| JSON.parse(HTTParty.get("https://itunes.apple.com/search?term=podcast&genreId=#{@category_hash[genre]}"))}).shuffle
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

    def suggestion_finder
      @favoriteGenres.map do |genre|
        results = HTTParty.get("https://itunes.apple.com/search?term=podcast&genreId#{genre}&limit=5")
      end
    end
end

