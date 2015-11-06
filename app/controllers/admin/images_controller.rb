class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Successfully created Image"
      redirect_to admin_images_path
    else
      flash.now[:error] = @image.errors.full_messages(', ')
      render :new
    end
  end


  private

  def image_params
    params.require(:image).permit(:name, :link)
  end

end
