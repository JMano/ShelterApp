class ChangeDataTypeForMedicalConditions < ActiveRecord::Migration
  def change
    change_column(:animals, :medical_conditions, :text)
  end
end
