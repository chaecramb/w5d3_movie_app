class AddPublishedOnToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :published_on, :date
  end
end
