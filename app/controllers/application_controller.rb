class ApplicationController < ActionController::Base
  #protect_from_forgery

  

  def color_response
    @response[:data].each do |hash|
      logger.debug hash[:id]
      hash[:data]["$color"] = "grey" unless @pinned.include?(hash[:id])
    end
    logger.debug @response.inspect
  end



  def parse_params
    logger.debug params.inspect
    if params.keys.include?("userid") && params.keys.include?("mapname")
      data        = Info.get(params["userid"], params["mapname"])
      @search_term= data["search_term"]
      @depth      = data["search_depth"]
      @pinned     = data["pinned_nodes"]
    elsif params.keys.include?("id")
      if params[:depth].blank?
        @depth = 3
      else
        @depth = params[:depth].to_i
      end
      @search_term = params[:id]
    else
      render :text => "Explosion! Missing required parameters", :status => 500
    end
  end


  def generate_response
    @object = ArtistName.seek(@search_term) || ReleaseName.seek(@search_term)

    if @object.blank?
      status    = 0
      descr     = "no data set returned"
      data      = nil
    else
      status    = 1
      descr     = "OK"
      data = @object.origin(@depth)
    end

    @response =
      {
        :status => status,
        :description => descr,
        :data => data
      }
  end
end
