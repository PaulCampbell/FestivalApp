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
  has_many :stages,  :dependent => :destroy
  has_many :users, :through => :user_festivals
  attr_accessible :name, :description, :startdate, :enddate, :logo
  
  validates :name, :presence => true,
                   :length => {:maximum => 100}
                   
  validates :description, :length => {:maximum => 250}
  
  validates :startdate, :presence => true
  
  validates :enddate, :presence => true	,
                      :date => { :after_or_equal_to => :startdate }
  
end
