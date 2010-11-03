# == Schema Information
# Schema version: 20101031155334
#
# Table name: events
#
#  id          :integer         not null, primary key
#  stage_id    :integer
#  band_id     :integer
#  description :text
#  starttime   :datetime
#  endtime     :datetime
#  created_at  :datetime
#  updated_at  :datetime
#  date        :date
#

class Event < ActiveRecord::Base

	has_one :band 
	
	attr_accessible :stage_id, :band_id, :description, :starttime, :endtime, :date
	
	validates :date, :presence => true
	
	validates :stage_id, :presence => true
	
	validates :band_id, :presence => true
	
	validates :starttime, :presence => true
  
    validates :endtime, :presence => true	,
                        :date => { :after => :starttime }
	

end
