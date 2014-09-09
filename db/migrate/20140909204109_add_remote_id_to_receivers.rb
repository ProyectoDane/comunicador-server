class AddRemoteIdToReceivers < ActiveRecord::Migration
  def self.up
    add_column :receivers, :remote_id, :integer
  end

  def self.down
    remove_column :receivers, :remote_id
  end
end
