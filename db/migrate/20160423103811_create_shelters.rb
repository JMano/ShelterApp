class CreateShelters < ActiveRecord::Migration
  def change
    create_table :shelters do |t|
      t.string :name
      t.string :description
      t.date :opening_date
      t.string :schedule
      t.timestamps null: false
    end
  end
end
