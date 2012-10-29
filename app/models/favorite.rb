class Favorite < ActiveRecord::Base
  attr_accessible :link_id, :user_id
  
  belongs_to :user
  belongs_to :link
end
