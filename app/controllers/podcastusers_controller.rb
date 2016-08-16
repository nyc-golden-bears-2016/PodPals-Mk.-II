class PodcastusersController < ApplicationController
  def destroy
    users_podcast = PodcastUser.find(params[:id])
    users_podcast.destroy
    redirect_to(current_user)
  end
end
