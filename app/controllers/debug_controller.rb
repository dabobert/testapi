class DebugController < ApplicationController
  respond_to :html, :xml, :json
  
  before_filter :generate_response

  def show    
    respond_with(@response) do |format|
      format.html
      format.json { render :json => @response.to_json }
      format.xml  { render :xml  => @response.to_xml }
    end
  end
  
  private
  
  def generate_response
    if params[:depth].blank?
      depth = 3
    else
      depth = params[:depth].to_i
    end
    
    @object = ArtistName.seek(params[:id]) || ReleaseName.seek(params[:id])
    
    if @object.blank?
      status    = 0
      descr     = "no data set returned"
      data      = nil
    else
      status    = 1
      descr     = "OK"
      data = @object.origin(depth)
    end
  
    @response =
      {
        :status => status,
        :description => descr,
        :data => data
      }
  
  end
  
end
