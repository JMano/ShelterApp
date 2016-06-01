class AddGendertoAnimal < ActiveRecord::Migration
  def change
      add_column :animals, :gender, :integer
  end
end
