class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user
  
  def index
  end
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] && User.exists?(session[:user_id])
  end
end
