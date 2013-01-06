class CreatePerformances < ActiveRecord::Migration
  def self.up
    create_table :performances do |t|
      t.datetime :start_datetime
      t.boolean  :reservable
      t.text     :notes, :length => 500

      t.timestamps
    end
  end

  def self.down
    drop_table :performances
  end
end
