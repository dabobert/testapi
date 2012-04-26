class DebugController < ApplicationController
  respond_to :html, :xml, :json

  before_filter :filter
  
  def create
    respond_with(@response) do |format|
      format.html
      format.json { render :json => @response.to_json, :callback=>params[:callback] }
      format.xml  { render :xml  => @response.to_xml }
    end
  end
  
  
  def index
    
    
    @response =
      {
        :status => "OK",
        :description => "descr",
        :data => @data
      }
    respond_with(@response) do |format|
      format.html { render :template => "/api/show.html.erb" }
      format.json { render :json => @response.to_json, :callback=>params[:callback] }
      format.xml  { render :xml  => @response.to_xml }
    end
  end
  
  private
  
  def filter
    @data     = Debug.wmgbja.origin(5)
    @filters  = ["contract"]
    
    
    
    
    
    
    
  end
  
end
