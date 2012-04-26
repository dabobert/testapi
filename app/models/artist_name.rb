class ArtistName < ActiveRecord::Base
  include NodeTools
  
  self.table_name = 'artist_name'
  has_one :artist, :foreign_key=>"name"
  has_one :credit, :class_name=>"ArtistCredit", :foreign_key=>"name"
  
  def self.seek(str)
    results = self.where("lower(talent_name) = lower(?)", str)
    talent = results.first
    talent
  end
  
  
  def to_s
    self.name
  end
  
  def origin(depth=3)
    hash = self.artist.response(depth)
    NodeTools::set_origin_height(hash)
  end
  
end
