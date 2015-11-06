class Admin::ImagesController < Admin::BaseController
  before_action :set_image, only: [:show, :destroy, :edit, :update]

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

  def show
  end

  def edit
  end

  def update
    if @image.update(image_params)
      flash[:notice] = "Successfully updated image!"
      redirect_to @image
     else
      flash[:error] = @image.errors.full_messages.join(', ')
      render :edit
    end
  end


  private

  def image_params
    params.require(:image).permit(:name, :link)
  end

  def set_image
    @image = Image.find(params[:id])
  end

end
