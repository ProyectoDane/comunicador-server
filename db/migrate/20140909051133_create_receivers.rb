class CreateReceivers < ActiveRecord::Migration
  def self.up
    create_table :receivers do |t|
      t.string :name
      t.string :last_name
      t.string :relationship
    end
  end

  def self.down
    drop_table :receivers
  end
end
