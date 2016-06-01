class Shelter < ActiveRecord::Base
  validates_presence_of :opening_date, :description, :name, :address
end
