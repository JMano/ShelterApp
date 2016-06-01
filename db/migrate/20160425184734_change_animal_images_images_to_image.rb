class ChangeAnimalImagesImagesToImage < ActiveRecord::Migration
  def change
    rename_column :animal_images, :images, :image
  end
end
