class ChangeDataTypeForDescription < ActiveRecord::Migration
  def change
    change_column(:animals, :description, :text)
  end
end
