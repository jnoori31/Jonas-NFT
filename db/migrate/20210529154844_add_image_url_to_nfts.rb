class AddImageUrlToNfts < ActiveRecord::Migration[6.0]
  def change
    add_column :nfts, :image_url, :string
  end
end
