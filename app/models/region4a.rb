class Region4a < ApplicationRecord
  belongs_to :region, dependent: :destroy
  belongs_to :article
  # VALIDATIONS
  validates :article_id, uniqueness: { scope: :region_id }
end
