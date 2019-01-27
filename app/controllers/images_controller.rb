class ImagesController < ApplicationController
  before_action :set_image, only: [:edit, :update, :show, :destroy]

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Image added"
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @image.update(image_params)
    redirect_to root_path
  end

  def destroy
    @image.destroy
  end

  def index
    @images = Image.all
  end

  def show
  end

  private
    def set_image
      @image = Image.find(params[:id])
      #code
    end

    def image_params
      params.require(:image).permit(:image_title, :category_id, :image_description, :image, :image_file_size, :image_content_type)
      #code
    end
end
