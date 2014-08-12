class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.string   :receptor
      t.string   :picture

      t.timestamps
    end
  end
end
