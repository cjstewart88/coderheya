class LinksController < ApplicationController
  before_filter :ensure_current_user, :except => [:increment_clicks]
  
  def new
    @link = Link.new
  end

  def create
    link_to_create = params[:link]

    if Link.find_by_url(link_to_create[:url]) 
      flash[:notice] = "Looks like that link has already been submitted."
      destination = new_link_path
    else  
      link_to_create[:user_id]  = @current_user.id

      new_link = Link.create(link_to_create)
      
      @current_user.favorites.create(:link_id => new_link.id)

      flash[:notice] = "Thanks for submitting a new link!"
      destination = root_url
    end
    
    redirect_to destination
  end
  
  def increment_clicks    
    link = Link.find(params[:id])
    link.increment(:clicks)
    link.save
    
    render :json => {
      :success  => true,
      :count    => link.clicks
    }
  end
end