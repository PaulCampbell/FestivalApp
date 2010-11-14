# == Schema Information
# Schema version: 20101106124830
#
# Table name: events
#
#  id          :integer         not null, primary key
#  stage_id    :integer
#  band_id     :integer
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  date        :date
#  day         :integer
#  starttime   :time
#  endtime     :time
#

class Event < ActiveRecord::Base

	belongs_to :band
	
	belongs_to :stage

  attr_accessor :artist_name
	
	attr_accessible :stage_id, :band_id, :description, :starttime, :endtime, :date, :band, :stage, :artist_name
	
	
	validates :stage_id, :presence => true
	
	validates :band_id, :presence => true

  validates :artist_name, :presence => true
	
	validates :starttime, :presence => true
  
  validates :endtime, :presence => true	,
                        :date => { :after => :starttime }


	#def artist_name
   # if !self.band.nil?
   #   self.band.name
  #  end
 # end

end
