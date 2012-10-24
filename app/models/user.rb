class User < ActiveRecord::Base
  attr_accessible :nickname, :provider, :uid, :gravatar_id

  def self.create_with_omniauth(auth)
    puts auth["extra"]["raw_info"]
 
    create! do | user |
      user.provider     = auth["provider"]
      user.uid          = auth["extra"]["raw_info"]["id"]
      user.nickname     = auth["extra"]["raw_info"]["login"]
      user.gravatar_id  = auth["extra"]["raw_info"]["gravatar_id"]
    end
  end
end