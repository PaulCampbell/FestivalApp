class ChangeEventDateToDateType < ActiveRecord::Migration
  def self.up
    remove_column :events, :day

    add_column :events, :day, :date

  end

  def self.down
     remove_column :events, :day
    add_column :events, :day, :integer
  end
end
