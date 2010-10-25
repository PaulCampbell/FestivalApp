class CreateBands < ActiveRecord::Migration
  def self.up
    create_table :bands do |t|
      t.string :name
      t.string :description
      t.string :picture
      t.string :weblink

      t.timestamps
    end
  end

  def self.down
    drop_table :bands
  end
end
