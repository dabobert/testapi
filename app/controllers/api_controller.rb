class ApiController < ApplicationController
  respond_to :html, :xml, :json

  before_filter :generate_response
  before_filter :color_response, :only=>:create

  def create
    respond_with(@response) do |format|
      format.html
      format.json { render :json => @response.to_json, :callback=>params[:callback] }
      format.xml  { render :xml  => @response.to_xml }
    end
  end

  def show    
    respond_with(@response) do |format|
      format.html
      format.json { render :json => @response.to_json, :callback=>params[:callback] }
      format.xml  { render :xml  => @response.to_xml }
    end
  end    
end
