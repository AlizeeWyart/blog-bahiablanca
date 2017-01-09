class AddUserfieldsToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :email, :string
    add_column :comments, :first_name, :string
    add_column :comments, :last_name, :string
  end
end
