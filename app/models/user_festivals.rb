# == Schema Information
# Schema version: 20101031172017
#
# Table name: user_festivals
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  festival_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class UserFestivals < ActiveRecord::Base
	belongs_to :user
	belongs_to :festival
end
