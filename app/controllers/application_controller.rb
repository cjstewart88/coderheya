class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  def index
  end
  
  private
  def current_user
    if User.exists?(session[:user_id])
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    else
      session[:user_id] = nil
      redirect_to root_url
    end
  end
end
