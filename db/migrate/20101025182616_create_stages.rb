class CreateStages < ActiveRecord::Migration
  def self.up
    create_table :stages do |t|
      t.integer :festival_id
      t.string :name
      t.text :description
      t.string :image
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end

  def self.down
    drop_table :stages
  end
end
