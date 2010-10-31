class AddIndexesToTables < ActiveRecord::Migration
  def self.up
   add_index :events, :stage_id
   add_index :events, :band_id
   
   add_index :stages, :festival_id
   
   
  end

  def self.down
   remove_index :events, :stage_id
   remove_index :events, :band_id
   
   remove_index :stages, :festival_id
  end
end
