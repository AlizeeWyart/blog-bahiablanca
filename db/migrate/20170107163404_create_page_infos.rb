class CreatePageInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :page_infos do |t|
      t.string :name
      t.text :content
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end
