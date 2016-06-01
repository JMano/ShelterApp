class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :contact
      t.string :subject
      t.integer :status
      t.text :content
      t.timestamps null: false
    end
  end
end
