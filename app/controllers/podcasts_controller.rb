class PodcastsController < ApplicationController
	def index
	end

	def show
		@podcasts = ITUNES_CLIENT.podcast(params[:search])
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end
end
