class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.references :article, foreign_key: true
      t.string :style
      t.string :photo
      t.string :photo2
      t.text :text
      t.string :video

      t.timestamps
    end
  end
end
