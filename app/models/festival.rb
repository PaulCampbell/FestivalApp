# == Schema Information
# Schema version: 20101030195840
#
# Table name: festivals
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  startdate   :date
#  enddate     :date
#  description :text
#  logo        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Festival < ActiveRecord::Base
  has_many :stages
end
