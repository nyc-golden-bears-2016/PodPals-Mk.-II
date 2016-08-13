class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@usersPodcasts = PodcastUser.where(user_id: @user.id)
	end
end