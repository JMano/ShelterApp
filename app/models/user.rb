class User < ActiveRecord::Base
  validates_presence_of :name, :cc, :contact, :address
end
