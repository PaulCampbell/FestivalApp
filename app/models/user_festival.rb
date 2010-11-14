# == Schema Information
# Schema version: 20101106124830
#
# Table name: user_festivals
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  festival_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class UserFestival < ActiveRecord::Base
  belongs_to :user
  belongs_to :festival
end
