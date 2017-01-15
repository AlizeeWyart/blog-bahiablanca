class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :message
      t.boolean :hidden, default: false
      t.boolean :seen, default: false

      t.timestamps
    end
  end
end
