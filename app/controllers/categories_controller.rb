class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @category = Category.new
  end

  def create
    Category.create(category_params) unless Category.find_by(category_params)
    redirect_to(categories_path)
  end

  def update
    @category.update(category_params)
    redirect_to @category
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private
    # def set_category
    #   @category = Category.find(params[:id])
    # end

    def category_params
      params.require(:category).permit(:name)
    end
end