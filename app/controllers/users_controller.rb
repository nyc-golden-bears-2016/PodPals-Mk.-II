class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@inQueue = PodcastUser.where(user_id: @user.id, in_queue: true)
		@favorites = PodcastUser.where(user_id: @user.id, favorite: true)
	end
end