class FriendsController < ApplicationController
	def create
		friend = Friend.new(friend_params)
		if friend.save
			redirect_to request.referer
		else
			redirect_to request.referer
		end
	end

	private

	def friend_params
		params.require(:friend).permit(:user_id, :friend_id)
	end
end