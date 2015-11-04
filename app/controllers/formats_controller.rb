class FormatsController < ApplicationController
  load_and_authorize_resource

  def index
    @format = Format.new
  end

  def create
    Format.create(format_params) unless Format.find_by(format_params)
    redirect_to(formats_path)
  end

  def update
    @format.update(format_params)
    redirect_to @format
  end

  def destroy
    @format.destroy
    redirect_to formats_path
  end

  private
    # def set_category
    #   @category = Category.find(params[:id])
    # end

    def format_params
      params.require(:format).permit(:name)
    end
end