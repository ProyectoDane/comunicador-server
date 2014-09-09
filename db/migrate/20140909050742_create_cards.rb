class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.string :name
    end

    change_column :interactions, :created_at, :datetime, :null => true
    change_column :interactions, :updated_at, :datetime, :null => true
  end

  def self.down
    change_column :interactions, :created_at, :datetime, :null => false
    change_column :interactions, :updated_at, :datetime, :null => false

    drop_table :cards
  end
end
