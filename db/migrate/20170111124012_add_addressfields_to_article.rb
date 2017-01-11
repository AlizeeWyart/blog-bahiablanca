class AddAddressfieldsToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :zip_code, :string
    add_column :articles, :city, :string
    add_column :articles, :country, :string
  end
end
