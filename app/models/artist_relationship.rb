class ArtistRelationship < ActiveRecord::Base
  set_table_name "l_artist_artist"
  belongs_to :member, :class_name=>"Artist", :foreign_key=>'entity0'
  belongs_to :band, :class_name=>"Artist", :foreign_key=>'entity1'
end
