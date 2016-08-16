class PodcastsController < ApplicationController


	def homepage

	end

	def index
		@podcast = Podcast.new
		@userPods = PodcastUser.new
		@tags = @podcast.tags.new
		@podcasts = ITUNES_CLIENT.podcast(params[:search])
	end

	def show
		@podcast = Podcast.find(params[:id])
		@discussion = Discussion.new
	end

	def new
	end

	def create
		@podcast = Podcast.new(podcast_params)
		results = ITUNES_CLIENT.podcast("#{podcast_params[:title]} #{podcast_params[:artist]}")
		if !results.resultCount
			redirect_to request.referer
		else
			if @podcast.save && params['commit'] ==  'Add to queue!'
				PodcastUser.create(user_id: current_user.id, podcast_id: @podcast.id, in_queue: true)
				redirect_to(current_user)
			elsif @podcast.save && params['commit'] ==  'Add to favorites!'
				PodcastUser.create(user_id: current_user.id, podcast_id: @podcast.id, favorite: true)
				redirect_to(current_user)
			else
				redirect_to request.referer
			end
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	def genres
	end

	def list
		@results_url = "https://itunes.apple.com/us/rss/toppodcasts/genre=#{params[:genre_id]}/json"
		@genre_results = HTTParty.get(@results_url)
		@parsed_results = JSON.parse(@genre_results)
		@title = @parsed_results
		render :genres_top
	end

	private

	def podcast_params
		params.require(:podcast).permit(:title, :genre, :artist, :image30, :image60, :image100)
	end

	def genre_params
	end
end

