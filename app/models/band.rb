# == Schema Information
# Schema version: 20101030195840
#
# Table name: bands
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  weblink     :string(255)
#  picture     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Band < ActiveRecord::Base
	
	has_many :stages, :through => :events, :source => "stage_id"

    attr_accessible :name, :description, :weblink, :picture
	
	validates :name,  :presence => true,
					  :length => {:maximum => 150}

	

end
