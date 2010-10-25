# == Schema Information
# Schema version: 20101025182802
#
# Table name: bands
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  picture     :string(255)
#  weblink     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Band < ActiveRecord::Base
end
