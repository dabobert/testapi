class ApiController < ApplicationController

  def show
    @object = ArtistName.seek(params[:id]) || ReleaseName.seek(params[:id])
    @response = @object.origin(3)
    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => response.to_json }
      format.xml  { render :xml => response }
    end
  end
end
