class ApplicationController < ActionController::Base
  #protect_from_forgery



  def color_response
    logger.debug "coloring response"
    @response[:data].each do |hash|
      hash[:data]["$color"] = "grey" unless params[:pinned_nodes].include?(hash[:id])
    end
  end


  def generate_response
    if params[:depth].blank?
      depth = 3
    else
      depth = params[:depth].to_i
    end

    #look for the search term in params[:id] or in params[:search_term]
    search_term = params[:id] || params[:search_term]

    @object = ArtistName.seek(search_term) || ReleaseName.seek(search_term)

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
