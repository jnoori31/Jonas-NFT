class CreateNfts < ActiveRecord::Migration[6.0]
  def change
    create_table :nfts do |t|
      t.string :name
      t.string :media_type
      t.integer :price
      t.string :category
      t.references :users, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
