class ChangeOwnerIdType < ActiveRecord::Migration[6.0]
  change_table :chatrooms do |t|
    t.change :owner_id, :integer
    t.change :client_id, :integer
  end
end
