class UserFestivals < ActiveRecord::Base
	belongs_to :user
	belongs_to :festival
end
