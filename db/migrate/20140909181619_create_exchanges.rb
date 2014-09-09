class CreateExchanges < ActiveRecord::Migration
  def self.up
    create_table :exchanges do |t|
      t.string   :receptor
      t.string   :picture
      t.integer  :level
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :exchanges
  end
end
