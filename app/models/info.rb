class Info
  require 'net/http'
  
  def self.get(userid, mapname)
    response = Net::HTTP.get('mywmg.vcap-wmg.me', "/UserData/Map?userid=#{userid}&mapname=#{mapname}")
    if response.blank?
      response
    else
      JSON.parse response
    end
  end
  

end
