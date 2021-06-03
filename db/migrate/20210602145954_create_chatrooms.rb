class CreateChatrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.references :owner, null: false
      t.references :client, null: false

      t.timestamps
    end
  end
end
