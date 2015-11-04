class AddMovieImageToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :movie_image, :string
  end
end
