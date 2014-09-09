class DropInteractionsTable < ActiveRecord::Migration
  def up
    drop_table :interactions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
