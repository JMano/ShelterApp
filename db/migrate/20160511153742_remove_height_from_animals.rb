class RemoveHeightFromAnimals < ActiveRecord::Migration
  def change
    remove_column :animals, :height, :integer
  end
end
