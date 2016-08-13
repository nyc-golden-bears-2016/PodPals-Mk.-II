class DiscussionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @discussions = Discussion.where(podcast_id: params[:id])
  end

  def show
    @discussion = Discussion.find(params[:id])
    @comment = Comment.new
  end

  def new
  end

  def create
    discussion = Discussion.new(discussion_params)
    discussion.user_id = current_user.id
    discussion.podcast_id = params[:podcast_id]
    if discussion.save
      redirect_to(discussion)
    else
      @errors = discussion.errors.full_messages
      redirect_to request.referer
    end
  end

  def edit
    @discussion = Discussion.find(params[:id])
    # @comment = @discussion.comment
  end

  def update
    @discussion = Discussion.find_by(id: params[:id], user_id: current_user.id)
    if @discussion && @discussion.update_attributes(discussion_params)
      redirect_to @discussion, notice: "Updated!"
    else
      render :edit
    end
  end

  def destroy
    @discussion = Discussion.find(params[:id])
    @podcast = @discussion.podcast
    @discussion.destroy
    redirect_to(@podcast)
  end


  private

  def discussion_params
    params.require(:discussion).permit(:title, :content)
  end
end


