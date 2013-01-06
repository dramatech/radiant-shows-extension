class CreateShows < ActiveRecord::Migration
  def self.up
    create_table :shows do |t|
      t.string  :title,    :length => 255
      t.string  :author,   :length => 255
      t.string  :director, :length => 255

      t.text    :description, :length => 500
      t.text    :notes, :length => 500

      t.integer :length_seconds
      t.integer :threshold_seconds

      t.boolean :private
      t.boolean :draft

      t.date    :reservations_open
      t.date    :reservations_close

      t.timestamps
    end
  end

  def self.down
    drop_table :shows
  end
end
