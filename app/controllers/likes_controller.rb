class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    if @like.save
    	if request.xhr?
    		render '_likes', layout: false, locals: {}
    	else
    		redirect_to request.referer
    	end
    else
    	redirect_to request.referer
    end
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
  end
end
