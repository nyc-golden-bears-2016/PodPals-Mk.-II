class LikesController < ApplicationController
  def create
    Like.create(like_params)
    redirect_to request.referer
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
  end
end
