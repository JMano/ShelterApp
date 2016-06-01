class AddImagesToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :images, :text
  end
end
