class Artist < ActiveRecord::Base
  include NodeTools
  
  self.table_name = 'artist'
  belongs_to :name, :class_name=>'ArtistName', :foreign_key => 'name'
  belongs_to :artist_type
  has_one :wmg_artist, :foreign_key=>"mb_id"
  has_one :wmg_talent, :foreign_key=>"mb_id"
  has_many :band_memberships, :class_name=>"ArtistRelationship", :foreign_key=>'entity0', :conditions=>"link <> 6340"
  has_many :talent_memberships, :class_name=>"ArtistRelationship", :foreign_key=>'entity1', :conditions=>"link <> 6340"

  def gcdm_object
    @gcdm_object = self.wmg_artist || self.wmg_talent
  end
  
  def name
    unless self.gcdm_object.blank?
      self.gcdm_object.name
    else
      ArtistName.find self[:name]
    end
  end

  
  def type
    unless self.gcdm_object.blank?
      self.gcdm_object.type
    else
      case self.artist_type_id
      when 1
        "talent"
      when 2
        "artist"
      else
        "other"
      end
    end
  end
  
  def id
    unless self.gcdm_object.blank?
      self.gcdm_object.gid
    else
      self.gid
    end
  end
  

  
  def response(depth=3)
    @depth = depth    
    @adjacencies  = Array.new
    @other_nodes  = Array.new
    if depth > 0
      
        self.iterate(self.band_memberships, (depth-1), "band")
        self.iterate(self.talent_memberships, (depth-1), "member")
        puts "#{self.name} => #{self.id}"
      begin
        self.iterate(self.name.credit.release_groups, (depth-1))
      rescue
      end
    end
    self.data+self.other_nodes
  end
  
  def talent_response(depth=3)
    @adjacencies  = Array.new
    @other_nodes  = Array.new
    if depth > 0
      begin
        self.iterate(self.talent_memberships, (depth-1), "member")
      rescue
      end
    end
    self.data+self.other_nodes
  end
  
  
end
