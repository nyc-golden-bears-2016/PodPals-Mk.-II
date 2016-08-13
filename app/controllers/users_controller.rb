class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@inQueue = PodcastUser.where(user_id: @user.id, in_queue: true)
		@favorites = PodcastUser.where(user_id: @user.id, favorite: true)

		if @user.id != current_user.id && Friend.where(user_id: @user.id, friend_id: current_user.id).count == 0
			@friend = Friend.new
			render '/friends/new'
		end
	end
end