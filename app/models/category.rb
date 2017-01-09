class Category < ApplicationRecord
  has_many :category4as
  has_many :articles, through: :category4as
end
