class AddShelterRefToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :shelter, index: true, foreign_key: true
  end
end
