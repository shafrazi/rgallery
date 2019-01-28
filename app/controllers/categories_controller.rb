class CategoriesController < ApplicationController
  def index
    #code
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category added"
      redirect_to categories_path
    else
      render "new"
    end
  end

  def edit
    @category = Category.find(params[:id])
    @images = @category.images.all
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to category_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  def show
    @category = Category.find(params[:id])
    @images = @category.images.all
  end

  private
    def category_params
      params.require(:category).permit(:name)
      #code
    end
end
