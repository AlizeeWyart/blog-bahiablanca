class Region < ApplicationRecord
  has_many :region4as
  has_many :articles, through: :region4as
  # PHOTO
  mount_uploader :photo, PhotoUploader
end
