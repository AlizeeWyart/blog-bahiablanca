class CreateRegion4as < ActiveRecord::Migration[5.0]
  def change
    create_table :region4as do |t|
      t.references :region, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
