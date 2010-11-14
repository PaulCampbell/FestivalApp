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
  
  has_many :user_festivals
  has_many :users, :through => :user_festivals
  attr_accessible :name, :description, :startdate, :enddate, :logo
  
  validates :name, :presence => true,
                   :length => {:maximum => 100}
                   
  validates :description, :length => {:maximum => 250}
  
  validates :startdate, :presence => true
  
  validates :enddate, :presence => true	,
                      :date => { :after_or_equal_to => :startdate }

  def day_count
   (enddate - startdate).to_i

  end

  def days
     i = 0
     days = Array.new
    while i < day_count do
      days << startdate.advance(:days => i).to_date
      i = i+1
    end

    return days
  end
  
end
