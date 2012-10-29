class FavoritesController < ApplicationController
  before_filter :ensure_current_user
  
  def create
    response = { :success => false }
    
    if Link.exists?(params["linkId"]) 
      @current_user.favorites.create(:link_id => params["linkId"])
      response[:success] = true
    end
    
    render :json => response
  end
  
  def destroy
    response = { :success => false }
    
    if @current_user.favorites.exists?(:link_id => params["linkId"])
      @current_user.favorites.where(:link_id => params["linkId"]).destroy_all
      response[:success] = true
    end
    
    render :json => response
  end
end