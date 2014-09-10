class RemoveTimestampsAndAddDateToExchanges < ActiveRecord::Migration
  def self.up
    rename_column :exchanges, :created_at, :date
    remove_column :exchanges, :updated_at
  end

  def self.down
    rename_column :exchanges, :date, :created_at
    add_column :exchanges, :updated_at, :datetime
  end
end
