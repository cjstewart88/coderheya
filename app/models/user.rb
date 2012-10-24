class User < ActiveRecord::Base
  attr_accessible :nickname, :provider, :uid, :gravatar_id

  def self.create_with_omniauth(auth)
    self.find_or_create_by_uid(
      :uid          => auth["id"],
      :provider     => auth["provider"],
      :nickname     => auth["nickname"],
      :gravatar_id  => auth["gravatar_id"]
    )
  end
end