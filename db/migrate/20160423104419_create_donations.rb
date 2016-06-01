class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.datetime :donation_date
      t.integer :donation_type
      t.string :description
      t.float :quantity
      t.timestamps null: false
    end
  end
end
