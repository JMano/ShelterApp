class AddAnimalToAdoptions < ActiveRecord::Migration
  def change
    add_reference :adoptions, :animal, index: true, foreign_key: true
  end
end
