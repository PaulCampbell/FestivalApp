# == Schema Information
# Schema version: 20101030195114
#
# Table name: users
#
#  id           :integer         not null, primary key
#  email        :string(255)
#  password     :string(255)
#  passwordsalt :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class User < ActiveRecord::Base
end
