class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.float :height
      t.date :entry_date
      t.string :medical_conditions
      t.integer :status
      t.integer :animal_type
      t.date :date_of_birth
      t.string :description
      t.string :situation
      t.timestamps null: false
    end
  end
end
