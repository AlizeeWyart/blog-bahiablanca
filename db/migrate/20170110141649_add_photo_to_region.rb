class AddPhotoToRegion < ActiveRecord::Migration[5.0]
  def change
    add_column :regions, :photo, :string
  end
end
