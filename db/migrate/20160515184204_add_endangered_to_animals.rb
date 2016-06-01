class AddEndangeredToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :endangered, :boolean
  end
end
