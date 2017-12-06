class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_for_cancel, :only => [:create, :update]

  include StoriesHelper

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
    @comment = Comment.new 
    @comment.story_id = @story.id
  end

  def new
    @story = Story.new
  end

  def edit
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(story_params)
    @story.save
    flash.notice = "Story '#{@story.title}' Created!"
    redirect_to story_path(@story)
  end

  def update
    @story = Story.find(params[:id])
    @story.update(story_params)
    flash.notice = "Story '#{@story.title}' Updated!"
    redirect_to story_path(@story)
  end

  def destroy
    @story = Story.find(params[:id]).destroy
    flash.notice = "Story '#{@story.title}' Deleted!"
    redirect_to stories_path
  end

  # Cancel action for create and update
  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to stories_path
    end
  end
end
