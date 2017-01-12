class AddFieldsToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :likes, :integer, default: 0
  end
end
