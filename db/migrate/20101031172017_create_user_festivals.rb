class CreateUserFestivals < ActiveRecord::Migration
  def self.up
    create_table :user_festivals do |t|
      t.integer :user_id
      t.integer :festival_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_festivals
  end
end
