class Info
  require 'net/http'
  require 'cgi'
  
  def self.get(userid, mapname)
    response = Net::HTTP.get_response(URI.parse("http://mywmg.wmg-int.wa1.wfabric.com/UserData/Map?userid=#{CGI.escape(userid)}&mapname=#{CGI.escape(mapname)}")).body
    
    if response.blank?
      response
    else
      JSON.parse response
    end
  end
  

end
