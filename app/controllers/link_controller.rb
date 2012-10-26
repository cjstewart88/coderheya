class LinksController < ApplicationController
  def create
    params = params.slice(:submitter, :title, :url)
    link = Link.find_by_url(params[:url]) || Link.create(params)
    redirect_to root_url
  end
end