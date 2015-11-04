class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :review
      t.integer :category_id
      t.integer :format_id

      t.timestamps null: false
    end
  end
end
