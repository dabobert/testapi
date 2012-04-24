class ApiController < ApplicationController

  def show
    if params[:depth].blank?
      depth = 3
    else
      depth = params[:depth].to_i
    end
    
    @object = ArtistName.seek(params[:id]) || ReleaseName.seek(params[:id])
    @response = @object.origin(depth)
    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => response.to_json }
      format.xml  { render :xml => response }
    end
  end
end
