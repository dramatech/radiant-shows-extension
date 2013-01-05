class CreateSeatingTypes < ActiveRecord::Migration
  def self.up
    create_table :seating_types do |t|
      t.references :seatable, :polymorphic => true
      t.string :name, :limit => 255
      t.integer :capacity
      t.timestamps
    end
  end

  def self.down
    drop_table :seating_types
  end
end
