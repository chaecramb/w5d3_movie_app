class MoviesController < ApplicationController
  load_and_authorize_resource
  def index
    @movie = Movie.new
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if params['tags']
      params['tags'].each do |tag_name|
        @movie.tags << Tag.find_by(name: tag_name)
      end
    end

    @movie.save 
    redirect_to movies_path
  end

  def update
    @movie.tags.clear
    params['tags'].each do |tag_name|
      @movie.tags << Tag.find_by(name: tag_name)
    end

    @movie.update(movie_params)
    redirect_to @movie
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_recipe
    #   @recipe = Recipe.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :review, :published_on, :category_id, :format_id, :movie_image)
    end
end