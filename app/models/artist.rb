class Artist < ActiveRecord::Base
  include NodeTools
  
  set_table_name 'artist'
  belongs_to :name, :class_name=>'ArtistName', :foreign_key => 'name'
  belongs_to :artist_type
  has_many :band_memberships, :class_name=>"ArtistRelationship", :foreign_key=>'entity0'
  has_many :talent_memberships, :class_name=>"ArtistRelationship", :foreign_key=>'entity1'
  
  
  def origin
    self.response(3)
  end
  
  def response(depth=3)
    @adjacencies  = Array.new
    @other_nodes  = Array.new
    self.band_memberships.each do |band_membership|
      self.adjacencies << self.make_adjacency(band_membership.band)
      self.other_nodes << self.make_node(band_membership.band)
    end
    
    self.talent_memberships.each do |talent_membership|
      self.adjacencies << self.make_adjacency(talent_membership.member)
      self.other_nodes << self.make_node(talent_membership.band)
    end
    
    self.name.credit.release_groups.each do |release_group|
      self.adjacencies << self.make_adjacency(release_group)
      self.other_nodes << self.make_node(release_group)
    end
    
    self.data+self.other_nodes
  end
  

  
  def type
    self.artist_type.to_s
  end
  
end
