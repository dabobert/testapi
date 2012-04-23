class ArtistType < ActiveRecord::Base
  set_table_name "artist_type"
  has_many :artists
  
  def to_s
    self.name
  end
  
end
