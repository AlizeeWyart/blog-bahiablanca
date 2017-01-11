class Article < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :user
  has_many :region4as
  has_many :regions, through: :region4as
  has_many :comments
  has_many :category4as
  has_many :categories, through: :category4as
end
