class ChangeShortDescriptionFormatInCategories < ActiveRecord::Migration[5.0]
  def change
    change_column :categories, :short_description, :text
  end
end
