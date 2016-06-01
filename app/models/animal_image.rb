class AnimalImage < ActiveRecord::Base
  mount_uploader :image, AnimalImageUploader
  belongs_to :animal
end
