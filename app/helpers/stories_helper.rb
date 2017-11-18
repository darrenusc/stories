module StoriesHelper
  def story_params
    params.require(:story).permit(:title, :body)
  end
end