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

  def create
    @story = Story.new(story_params)
    @story.save
    redirect_to story_path(@story)
  end
end
