class Article < ApplicationRecord
  belongs_to :user
  has_many :region4as
  has_many :regions, through: :region4as
  has_many :comments
  has_many :category4as
  has_many :categories, through: :category4as
end
