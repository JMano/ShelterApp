class AddEmployeeToAdoptions < ActiveRecord::Migration
  def change
    add_reference :adoptions, :employee, index: true, foreign_key: true
  end
end
