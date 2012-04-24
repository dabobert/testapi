class ApiController < ApplicationController
  respond_to :html, :xml, :json

  before_filter :parse_params, :generate_response
  before_filter :color_response, :only=>:index

  def show
    respond_with(@response) do |format|
      format.html
      format.json { render :json => @response.to_json, :callback=>params[:callback] }
      format.xml  { render :xml  => @response.to_xml }
    end
  end
  
  def index
    respond_with(@response) do |format|
      format.html { render :action => :show}
      format.json { render :json => @response.to_json, :callback=>params[:callback] }
      format.xml  { render :xml  => @response.to_xml }
    end
  end
end
