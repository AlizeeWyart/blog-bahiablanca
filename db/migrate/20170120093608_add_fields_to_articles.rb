class AddFieldsToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :heart, :integer, default:0
    add_column :contents, :order, :integer, default:0
  end
end
