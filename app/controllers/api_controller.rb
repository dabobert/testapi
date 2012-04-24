class ApiController < ApplicationController
  respond_to :html, :xml, :json

  def show
    if params[:depth].blank?
      depth = 3
    else
      depth = params[:depth].to_i
    end
    
    @object = ArtistName.seek(params[:id]) || ReleaseName.seek(params[:id])
    @response = @object.origin(depth)
    respond_with(@response) do |format|
      format.html
      format.json { render :json => @response.to_json }
      format.xml  { render :xml  => @response.to_xml }
    end
  end
end
