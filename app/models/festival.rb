# == Schema Information
# Schema version: 20101025182802
#
# Table name: festivals
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  startdate   :date
#  enddate     :date
#  description :text
#  website     :string(255)
#  logo        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Festival < ActiveRecord::Base
	has_many :stages
	
	validates :name, :presence => true, :length => { :maximum => 250 }
	
	validates :startdate, :presence => true
	
	validates :enddate, :presence => true
	
	

end
