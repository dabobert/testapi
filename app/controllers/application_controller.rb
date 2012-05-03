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
    
    if params.keys.include?("userid") && params.keys.include?("mapname")
      data        = Info.get(params["userid"], params["mapname"])
      @search_term= data["search_term"]
      @depth      = data["search_depth"]
      @pinned     = data["pinned_nodes"]
      @filters    = data["search_filters"]
      @data_set   = data["search_data_set"].to_i
    elsif params.keys.include?("id")
=begin      
      if params[:depth].blank?
        @depth = 3
      else
        @depth = params[:depth].to_i
      end
=end
      @depth = params[:depth].to_i
      @filters = params[:filters] unless params[:filters].blank?
      @search_term = params[:id]
      @data_set = params[:data_set].to_i
    else
      render :text => "Explosion! Missing required parameters", :status => 500
    end
    
    @filters = @filters.split(",") unless @filters.blank?
  end



  def generate_response
    
    case @data_set
    when 0
      @object = ArtistName.seek(@search_term) || ReleaseName.seek(@search_term)
    when 1
      @object = WmgTalent.seek(@search_term) || WmgArtist.seek(@search_term)
    end
    
    if @filters.blank? && (@depth.blank? || @depth == 0)
      @depth = 11
      Debug.echo "using default of 11"
    elsif not(@filters.blank?)
      Debug.echo "finding depth dynamically"
      @depth = [NodeFilter.assign_depth(@filters), @depth].compact.max
    end
    
    Debug.echo "nil? #{@object.blank?}"
    
    if @object.blank?
      status    = 0
      descr     = "no data set returned"
      data      = nil
    else
      status    = 1
      descr     = "OK"
      data = @object.origin(@depth)
    end

    data  = NodeFilter.new(data).filter(@filters) unless (@filters.blank? or data.blank?)

    @response =
      {
        :status => status,
        :description => descr,
        :data => data
      }
  end
end
