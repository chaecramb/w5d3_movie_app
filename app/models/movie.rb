class Movie < ActiveRecord::Base
  mount_uploader :movie_image, MovieImageUploader

  belongs_to :format
  belongs_to :category
  has_and_belongs_to_many :tags

end
