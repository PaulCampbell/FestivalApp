class SortOutTimesOnEvents < ActiveRecord::Migration
  def self.up
    remove_column :events, :starttime
    remove_column :events, :endtime
    remove_column :events, :date

    add_column :events, :starttime, :datetime
    add_column :events, :endtime, :datetime
  end

  def self.down
    remove_column :events, :starttime
    remove_column :events, :endtime

    add_column :events, :date, :datetime
    add_column :events, :starttime, :time
    add_column :events, :endtime, :time
  end
end
