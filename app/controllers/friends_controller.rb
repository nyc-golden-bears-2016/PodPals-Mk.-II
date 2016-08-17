class FriendsController < ApplicationController
	before_action :user_signed_in?, :except => [:index, :show]
	def index
		@user = User.find(params[:user_id])
	end
	
	def show
		redirect_to user_path(params[:id])
	end
	
	def new
		@friend = Friend.new
	end

	def create
	@user = User.find(current_user.id)
	@friend = User.find(params[:friend_id])
	friend_params = {:user_id => @user.id, :friend_id => @friend.id, :pending => true}	
	@friendship = Friendship.new(friend_params)
		if @friendship.save
			redirect_to user_friends_path(current_user)
		else
			redirect_to user_path(current_user)
		end
	end
	
	def update
	@user = User.find(params[:user_id])
	@friend = Friendship.find(params[:id])
		friend_params = {:user_id => @friend.user_id, :friend_id => @friend.friend_id, :pending => false}
			@friendship = Friendship.find_by_user_id_and_friend_id(@friend.user_id, @friend.friend_id)
		if @friendship.update_attributes(friend_params)
			flash[:notice] = 'Friend sucessfully accepted!'
			redirect_to user_friends_path(current_user)
		else
			redirect_to user_path(current_user)
		end
	end

	def destroy
		@user = User.find(params[:user_id])
			@friend = User.find(params[:id])
			@friendship = Friendship.find_by(user_id: @user.id, friend_id: @friend.id).destroy
			redirect_to user_friends_path(:user_id => current_user)
	end

	private

	def friend_params
		params.require(:friend).permit(:user_id, :friend_id, :pending)
	end
end