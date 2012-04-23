class ReleaseGroup < ActiveRecord::Base
  include NodeTools
  
  set_table_name 'release_group'
  belongs_to :group_type, :class_name=>"ReleaseGroupType"
  belongs_to :name, :class_name=>"ReleaseName", :foreign_key=>'name'
  belongs_to :artist_credit, :foreign_key=>"artist_credit"
  has_many :releases, :foreign_key=>"release_group"
  has_many :barcoded_releases, :class_name=>"Release", :foreign_key=>"release_group", :conditions => "barcode is not null"
  
  def response(depth=3)
    @adjacencies  = Array.new
    @other_nodes  = Array.new
    #self.iterate(self.barcoded_releases, (depth-1)) if depth > 0
    self.data+self.other_nodes
  end
  
  def color
    "blue"
  end
  
  def type
    "project"
  end
end
