class Artist < ActiveRecord::Base
  set_table_name 'artist'
  belongs_to :name, :class_name=>'ArtistName', :foreign_key => 'name'
  belongs_to :artist_type
  has_many :band_memberships, :class_name=>"ArtistRelationship", :foreign_key=>'entity0'
  has_many :artist_memberships, :class_name=>"ArtistRelationship", :foreign_key=>'entity1'
end
