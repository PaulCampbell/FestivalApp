class CreateBands < ActiveRecord::Migration
  def self.up
    create_table :bands do |t|
      t.string :name
      t.text :description
      t.string :weblink
      t.string :picture

      t.timestamps
    end
  end

  def self.down
    drop_table :bands
  end
end
