require 'date'

# == Schema Information
# Schema version: 20101030195840
#
# Table name: stages
#
#  id          :integer         not null, primary key
#  festival_id :integer
#  name        :string(255)
#  description :text
#  picture     :string(255)
#  longitude   :float
#  latitude    :float
#  created_at  :datetime
#  updated_at  :datetime
#

class Stage < ActiveRecord::Base
	belongs_to :festival
	
	has_many :events
	has_many :bands, :through => :events
	
	attr_accessible :name, :description, :latitude, :longitude, :picture, :festival	


	validates :name,  :presence => true,
					  :length => {:maximum => 100}

  def line_ups

    line_ups = Array.new

    self.festival.days.each do |d|

      day_lineup = Line_up.new

      day_lineup.set_date(d)

      self.events.each do |e|
        if e.day == d
          day_lineup.events << e
        end

      end

      day_lineup.events.sort! { |a,b| a.starttime <=> b.starttime }

      line_ups << day_lineup
  
    end


    return line_ups

  end

end

class Line_up

  def initialize
    @date =  DateTime.now
    @events = Array.new
  end

  def date
    @date
  end

  def events
    @events
  end

  def set_date(d)
    @date = d
  end
end
