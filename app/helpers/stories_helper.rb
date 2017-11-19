module StoriesHelper
  def story_params
    params.require(:story).permit(:title, :body, :tag_list)
  end
end