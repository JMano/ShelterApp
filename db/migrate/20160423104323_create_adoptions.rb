class CreateAdoptions < ActiveRecord::Migration
  def change
    create_table :adoptions do |t|
      t.date :adoption_date
      t.integer :adoption_type
      t.timestamps null: false
    end
  end
end
