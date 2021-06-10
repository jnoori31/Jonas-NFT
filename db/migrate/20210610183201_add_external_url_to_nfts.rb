class AddExternalUrlToNfts < ActiveRecord::Migration[6.0]
  def change
    add_column :nfts, :external_url, :string
  end
end
