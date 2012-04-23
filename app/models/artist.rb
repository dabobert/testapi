class Artist < ActiveRecord::Base
  include NodeTools
  
  set_table_name 'artist'
  belongs_to :name, :class_name=>'ArtistName', :foreign_key => 'name'
  belongs_to :artist_type
  has_many :band_memberships, :class_name=>"ArtistRelationship", :foreign_key=>'entity0', :conditions=>"link <> 6340"
  has_many :talent_memberships, :class_name=>"ArtistRelationship", :foreign_key=>'entity1', :conditions=>"link <> 6340"
  

  
  def response(depth=3)
    @adjacencies  = Array.new
    @other_nodes  = Array.new
    if depth > 0
      begin
      self.iterate(self.band_memberships, (depth-1), "band")
      self.iterate(self.talent_memberships, (depth-1), "member")
      self.iterate(self.name.credit.release_groups, (depth-1))
    rescue
    end
    end
    self.data+self.other_nodes
  end
  
  def color
    case self.artist_type_id
    when 1
      "red"
    when 2
      "purple"
    else
      "white"
    end
  end
  
  def type
    self.artist_type.to_s
  end
  
end
