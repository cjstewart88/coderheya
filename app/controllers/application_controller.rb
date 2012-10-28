class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :current_user
  
  helper_method :links
  
  def index
  end
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] && User.exists?(session[:user_id])
  end
  
  def links(tag)
    if tag == :all
      links = Link.order("created_at DESC").all
    else
      Link.tagged_with(tag)
    end
  end
end