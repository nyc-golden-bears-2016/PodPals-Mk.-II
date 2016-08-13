class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
  end

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.commentable_id = params[:discussion_id]
    comment.commentable_type = "Discussion"
    if comment.save!
      redirect_to request.referer
    else
      @errors = comment.errors.full_messages
      redirect_to request.referer
    end
  end

  # def edit
  #   @comment = Comment.find(params[:id])
  # end

  # def update
  #   @comment = Comment.find_by(id: params[:id], user_id: current_user.id)
  #   if @comment && @comment.update_attributes(comment_params)
  #     redirect_to @discussion, notice: "Updated!"
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @comment = Comment.find(params[:id])
  #   @podcast = @discussion.podcast
  #   @comment.destroy
  #   redirect_to(@podcast)
  # end


  private

  def comment_params
    params.require(:comment).permit(:content, :discussion_id)
  end

end


