class Link < ActiveRecord::Base
  attr_accessible :submitter, :title, :url
  acts_as_taggable
  acts_as_taggable_on :tags
  
  def self.create(params)
    create! do | link |
      link.submitter  = params["submitter"]
      link.title      = params["title"]
      link.url        = params["url"]
    end
  end
end