class Link < ActiveRecord::Base
  attr_accessible :submitter, :title, :url
  
  acts_as_taggable
  acts_as_taggable_on :tags
  
  belongs_to :user
  
  def self.create(params)
    new_link = create! do | link |
      link.user_id  = params["user_id"]
      link.title    = params["title"]
      link.url      = params["url"]
    end
    
    new_link.tag_list = params[:tags].split(',')
    new_link.save
    
    new_link
  end
end