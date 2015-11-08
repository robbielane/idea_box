class ImagesController < ApplicationController
  def new
    @images = Image.all
  end

  def create
    idea = Idea.find(params[:idea_id])
    image = Image.find(params[:image_id])
    IdeasImage.find_or_create_by(idea_id: idea.id, image_id: image.id)
    redirect_to idea_path(idea)
  end
end
