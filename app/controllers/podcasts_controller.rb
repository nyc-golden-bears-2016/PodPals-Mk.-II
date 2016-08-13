class PodcastsController < ApplicationController
	def homepage

	end

	def index
		@podcast = Podcast.new
		@userPods = PodcastUser.new
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
		# results = ITUNES_CLIENT.podcast(podcast_params)
		# if results.resultCount == 0
		# 	redirect_to request.referer
		# else
			if @podcast.save && params['commit'] ==  'Add to queue!'
				PodcastUser.create(user_id: current_user.id, podcast_id: @podcast.id, in_queue: true)
				redirect_to(current_user)
			elsif @podcast.save && params['commit'] ==  'Add to favorites!'
				PodcastUser.create(user_id: current_user.id, podcast_id: @podcast.id, favorite: true)
				redirect_to(current_user)
			else
				redirect_to request.referer
			end
		# end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def podcast_params
		params.require(:podcast).permit(:title, :genre)
	end
end

