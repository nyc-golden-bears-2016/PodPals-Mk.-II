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
		@like = Like.new
		@share = Share.new
	end

	def new
	end

	def create
		@podcast = Podcast.find_or_initialize_by(podcast_params)
		results = ITUNES_CLIENT.podcast("#{podcast_params[:title]} #{podcast_params[:artist]}")
		if !results.resultCount
			redirect_to request.referer,
			alert: "no podcasts found"
		else
			if @podcast.save && params['commit'] ==  'Add to queue!'
				@userPod = PodcastUser.find_or_initialize_by(user_id: current_user.id, podcast_id: @podcast.id, in_queue: true)
				if @userPod.id == nil
					@userPod.save
					redirect_to request.referer,
					alert: "successfully added to queue!"
				else
					flash.now[:alert] = "Already on your queue list!"
				end
			elsif @podcast.save && params['commit'] ==  'Add to favorites!'
				@userPod = PodcastUser.find_or_initialize_by(user_id: current_user.id, podcast_id: @podcast.id, favorite: true)
				if @userPod.id == nil
					@userPod.save
					redirect_to request.referer,
					alert: "successfully added to favorites!"
				else
					flash.now[:alert] = "You already favorited this podcast!"
				end
			elsif @podcast.save && params['commit'] == 'View active discussions'
				redirect_to(@podcast)
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

	def share
		byebug
		@podcast = Podcast.find(params[:id])
		@user = User.find(params[:friend])
		if @podcast
			# share successful flash
			PodcastMailer.share_podcast(@user, @podcast)
		else
			# unsuccessful share flash 
			redirect_to(@podcast)
		end
	end

	private

	def podcast_params
		params.require(:podcast).permit(:title, :genre, :artist, :image30, :image60, :image100)
	end

	def genre_params
	end
end

