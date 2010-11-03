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

	

end
