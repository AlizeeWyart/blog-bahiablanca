class Category < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :category4as
  has_many :articles, through: :category4as
end
