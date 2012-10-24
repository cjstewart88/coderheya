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

  #<OmniAuth::AuthHash 
  # credentials=#<Hashie::Mash expires=false token="69b0317fcf143e07877e17c790ab8070a32d16da"> 
  # extra=#<Hashie::Mash raw_info=#<Hashie::Mash _links=#<Hashie::Mash self=#<Hashie::Mash href="https://api.github.com/users/cjstewart88">> 
  # avatar_url="https://secure.gravatar.com/avatar/508aeb41ecccc7f86d72dae483e81729?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" 
  # created_at="2010-12-23T19:25:43Z" 
  # followers=8 
  # following=1 
  # gravatar_id="508aeb41ecccc7f86d72dae483e81729" 
  # html_url="https://github.com/cjstewart88" 
  # id=534912 login="cjstewart88" 
  # public_gists=6 
  # public_repos=8 
  # type="User" 
  # url="https://api.github.com/users/cjstewart88">> 
  # info=#<OmniAuth::AuthHash::InfoHash email=nil 
  # image="https://secure.gravatar.com/avatar/508aeb41ecccc7f86d72dae483e81729?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" 
  # name=nil nickname="cjstewart88" 
  # urls=#<Hashie::Mash Blog=nil GitHub="https://github.com/cjstewart88">> 
  # provider="github" 
