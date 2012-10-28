class LinksController < ApplicationController
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

      Link.create(link_to_create)

      flash[:notice] = "Thanks for submitting a new Guide/Reference!"
      destination = root_url
    end
    
    redirect_to destination
  end
end