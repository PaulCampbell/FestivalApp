class AddDayToEvent < ActiveRecord::Migration
  def self.up
    remove_column :events, :starttime
    remove_column :events, :endtime

    add_column :events, :day, :integer
    add_column :events, :starttime, :time
    add_column :events, :endtime, :time


  end

  def self.down
    remove_column :events, :day

    add_column :events, :starttime, :datetime
    add_column :events, :endtime, :datetime
  end
end
