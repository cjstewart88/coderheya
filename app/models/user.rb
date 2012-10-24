class User < ActiveRecord::Base
  attr_accessible :nickname, :provider, :uid, :gravatar_id

  def self.create_with_omniauth(auth)
    puts auth["extra"]
    puts auth["info"]
 
    create! do | user |
      user.provider     = auth["provider"]
      user.uid          = auth["extra"]["id"]
      user.nickname     = auth["info"]["nickname"]
      user.gravatar_id  = auth["extra"]["gravatar_id"]
    end
  end
end