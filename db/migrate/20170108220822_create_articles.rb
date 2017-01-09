class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :short_description
      t.text :content
      t.date :date

      t.timestamps
    end
  end
end
