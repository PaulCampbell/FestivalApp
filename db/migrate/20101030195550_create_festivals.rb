class CreateFestivals < ActiveRecord::Migration
  def self.up
    create_table :festivals do |t|
      t.string :name
      t.date :startdate
      t.date :enddate
      t.text :description
      t.string :logo

      t.timestamps
    end
  end

  def self.down
    drop_table :festivals
  end
end
