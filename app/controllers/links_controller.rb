class LinksController < ApplicationController
  before_filter :ensure_current_user
  
  def new
    @link = Link.new
  end

  def create
    link_to_create = params[:link]

    if Link.find_by_url(link_to_create[:url]) 
      flash[:notice] = "Looks like that Guide/Reference has already been submitted."
      destination = new_link_path
    else  
      link_to_create[:user_id]  = @current_user.id

      new_link = Link.create(link_to_create)
      
      @current_user.favorites.create(:link_id => new_link.id)

      flash[:notice] = "Thanks for submitting a new Guide/Reference!"
      destination = root_url
    end
    
    redirect_to destination
  end
end