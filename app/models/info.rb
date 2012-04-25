class Info
  require 'net/http'
  
  def self.get(userid, mapname)
    response = Net::HTTP.get_response(URI.parse("http://mywmg.vcap-wmg.me/UserData/Map?userid=#{CGI.escape(userid)}&mapname=#{CGI.escape(mapname)}")).body
    
    if response.blank?
      response
    else
      JSON.parse response
    end
  end
  

end
