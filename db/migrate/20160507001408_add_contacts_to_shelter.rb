class AddContactsToShelter < ActiveRecord::Migration
  def change
    add_column :shelters, :phone, :integer
    add_column :shelters, :email, :string
  end
end
