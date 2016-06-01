class AddSizeToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :size, :integer
  end
end
