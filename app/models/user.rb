class User < ActiveRecord::Base
  attr_accessible :nickname, :provider, :uid, :gravatar_id
  
  has_many :links, :through => :favorites
  has_many :favorites
  
  def self.create_with_omniauth(auth)
    create! do | user |
      user.provider     = auth["provider"]
      user.uid          = auth["extra"]["raw_info"]["id"]
      user.nickname     = auth["extra"]["raw_info"]["login"]
      user.gravatar_id  = auth["extra"]["raw_info"]["gravatar_id"]
    end
  end
end