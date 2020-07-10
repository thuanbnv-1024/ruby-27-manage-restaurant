class Image < ApplicationRecord
  belongs_to :dish
  mount_uploader :image, ImageUploader
end
