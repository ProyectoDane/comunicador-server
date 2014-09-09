class UpdateExchangeColumns < ActiveRecord::Migration
  def self.up
    add_column :exchanges, :pick, :string
    add_column :exchanges, :reach, :string
    add_column :exchanges, :drop, :string
    add_column :exchanges, :card_id, :integer
    add_column :exchanges, :user_id, :integer
    add_column :exchanges, :receiver_id, :integer
    remove_column :exchanges, :receptor
    remove_column :exchanges, :picture

    add_index :exchanges, [:card_id]
    add_index :exchanges, [:user_id]
    add_index :exchanges, [:receiver_id]
  end

  def self.down
    remove_column :exchanges, :pick
    remove_column :exchanges, :reach
    remove_column :exchanges, :drop
    remove_column :exchanges, :card_id
    remove_column :exchanges, :user_id
    remove_column :exchanges, :receiver_id
    add_column :exchanges, :receptor, :string
    add_column :exchanges, :picture, :string

    remove_index :exchanges, :name => :index_exchanges_on_card_id rescue ActiveRecord::StatementInvalid
    remove_index :exchanges, :name => :index_exchanges_on_user_id rescue ActiveRecord::StatementInvalid
    remove_index :exchanges, :name => :index_exchanges_on_receiver_id rescue ActiveRecord::StatementInvalid
  end
end
