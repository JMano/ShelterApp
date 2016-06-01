class Request < ActiveRecord::Base
  belongs_to :shelters

  validates_presence_of :name, :contact, :subject, :status, :content, :shelter_id
end
