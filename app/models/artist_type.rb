class ArtistType < ActiveRecord::Base
  self.table_name = "artist_type"
  has_many :artists
  
  def to_s
    self.name
  end
  
end
