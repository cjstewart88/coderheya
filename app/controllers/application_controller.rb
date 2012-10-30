class ApplicationController < ActionController::Base
  protect_from_forgery

  require 'will_paginate/array'

  before_filter :ensure_domain
  before_filter :current_user
  
  helper_method :links
  
  APP_DOMAIN = 'www.coderheya.com'

  def ensure_domain
    if Rails.env.production? && request.env['HTTP_HOST'] != APP_DOMAIN
      redirect_to "http://#{APP_DOMAIN}#{request.fullpath}", :status => 301
    end
  end
  
  def index
    options = {
      :tag      => params[:tag],
      :all      => params[:tag].nil?,
      :nickname => params[:nickname]
    }
    
    if options[:nickname]
      redirect_to root_url and return if User.find_by_nickname(options[:nickname]).nil?
      @user_profile = User.where(:nickname => options[:nickname]).first
    end
    
    @links = links(options)
  end
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] && User.exists?(session[:user_id])
  end
  
  def ensure_current_user
    redirect_to root_url if !@current_user
  end
  
  def links(options)
    if options[:nickname] 
      if options[:tag]
        favorites = User.find_by_nickname(options[:nickname]).links
        favorites.tagged_with(options[:tag]).paginate(:page => params[:page])
      else
        User.find_by_nickname(options[:nickname]).links.paginate(:page => params[:page])
      end 
    elsif options[:all]
      Link.order("created_at DESC").paginate(:page => params[:page])
    else
      Link.tagged_with(params[:tag]).paginate(:page => params[:page])
    end
  end
end