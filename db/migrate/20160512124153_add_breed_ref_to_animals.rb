class AddBreedRefToAnimals < ActiveRecord::Migration
  def change
    add_reference :animals, :breed, index: true, foreign_key: true
  end
end
