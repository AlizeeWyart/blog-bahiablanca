class AddPhotocommentsToContent < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :photo_description, :string
    add_column :contents, :photo_description2, :string
  end
end
