class CreateAnimalImages < ActiveRecord::Migration
  def change
    create_table :animal_images do |t|
      t.integer :animal_id
      t.text :images
      t.timestamps null: false
    end
  end
end
