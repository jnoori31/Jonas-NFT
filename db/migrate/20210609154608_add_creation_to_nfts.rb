class AddCreationToNfts < ActiveRecord::Migration[6.0]
  def change
    add_column :nfts, :creation, :boolean
  end
end
