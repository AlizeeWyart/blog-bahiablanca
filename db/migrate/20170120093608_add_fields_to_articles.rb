class AddFieldsToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :heart, :integer
    add_column :contents, :order, :integer
  end
end
