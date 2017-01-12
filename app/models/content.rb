class Content < ApplicationRecord
  belongs_to :article
  mount_uploader :photo, PhotoUploader
  mount_uploader :photo2, PhotoUploader
  STYLE = ["Texte uniquement", "Deux photos", "Une vidéo", "Une photo", "Portrait artisan"]
  validates :style, inclusion: { in: STYLE,
     message: "%{value} n'est pas valide" }
end
