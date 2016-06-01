class AddEmployeeToDonations < ActiveRecord::Migration
  def change
    add_reference :donations, :employee, index: true, foreign_key: true
  end
end
