class AddUserToAdoptions < ActiveRecord::Migration
  def change
    add_reference :adoptions, :user, index: true, foreign_key: true
  end
end
