class ArtistName < ActiveRecord::Base
  set_table_name 'artist_name'
  has_one :artist, :foreign_key=>"name"
  has_one :credit, :class_name=>"ArtistCredit", :foreign_key=>"name"
end
