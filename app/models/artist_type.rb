class ArtistType < ActiveRecord::Base
  set_table_name "artist_type"
  has_many :artists
end
