class Article < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :user
  belongs_to :category
  has_many :region4as, :dependent => :destroy
  has_many :regions, through: :region4as
  has_many :comments, :dependent => :destroy
  has_many :contents, :dependent => :destroy
  has_many :category4as, :dependent => :destroy
end
