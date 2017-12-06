class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.new(comment_params)
    @comment.story_id = params[:story_id]
    @comment.save
    redirect_to story_path(@comment.story)
  end

  def destroy
    @story = Story.find(params[:story_id])
    @comment = @story.comments.find(params[:id]).destroy
    flash.notice = "Comment by '#{@comment.author}' Deleted!"
    redirect_to story_path(@comment.story)
  end
  
  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
