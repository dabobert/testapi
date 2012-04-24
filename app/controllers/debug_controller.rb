class DebugController < ApplicationController
  respond_to :html, :xml, :json

  before_filter :generate_response

  def create
    respond_with(@response) do |format|
      format.html
      format.json { render :json => @response.to_json, :callback=>params[:callback] }
      format.xml  { render :xml  => @response.to_xml }
    end
  end
  
end
