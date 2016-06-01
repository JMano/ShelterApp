class AddEmployeeToVolunteers < ActiveRecord::Migration
  def change
    add_reference :volunteers, :employee, index: true, foreign_key: true
  end
end
