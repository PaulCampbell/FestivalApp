# == Schema Information
# Schema version: 20101025182802
#
# Table name: stages
#
#  id          :integer         not null, primary key
#  festival_id :integer
#  name        :string(255)
#  description :text
#  image       :string(255)
#  longitude   :float
#  latitude    :float
#  created_at  :datetime
#  updated_at  :datetime
#

class Stage < ActiveRecord::Base
	belongs_to :festival
	
	validates :name, :presence => true
				   , :length => { :maximum => 250 }

end
