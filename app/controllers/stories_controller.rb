class StoriesController < ApplicationController
  include StoriesHelper
  
  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
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
    redirect_to story_path(@story)
  end

  def update
    @story = Story.find(params[:id])
    @story.update(story_params)
    redirect_to story_path(@story)
  end

  def destroy
    @story = Story.find(params[:id]).destroy
    redirect_to stories_path
  end
end
