# == Schema Information
# Schema version: 20101115093602
#
# Table name: events
#
#  id          :integer         not null, primary key
#  stage_id    :integer
#  band_id     :integer
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  starttime   :datetime
#  endtime     :datetime
#  day         :date
#

class Event < ActiveRecord::Base

	belongs_to :band
	
	belongs_to :stage

  attr_accessor :artist_name
	
	attr_accessible :stage_id, :band_id, :description, :starttime, :endtime, :date, :band, :stage, :artist_name, :day
	
	
	validates :stage_id, :presence => true
	

  validates :artist_name, :presence => true

  validates :day, :presence => true
	
	validates :starttime, :presence => true
  
  validates :endtime, :presence => true	,
                        :date => { :after => :starttime, :message => 'End time must be after start time.' }


end
