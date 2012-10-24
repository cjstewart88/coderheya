class User < ActiveRecord::Base
  attr_accessible :nickname, :provider, :uid, :gravatar_id

  def self.create_with_omniauth(auth)
    self.find_or_create_by_uid(
      :uid          => auth["extra"]["id"],
      :provider     => auth["provider"],
      :nickname     => auth["extra"]["login"],
      :gravatar_id  => auth["extra"]["gravatar_id"]
    )
  end
end