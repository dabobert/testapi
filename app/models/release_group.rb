class ReleaseGroup < ActiveRecord::Base
  include NodeTools
  
  set_table_name 'release_group'
  belongs_to :group_type, :class_name=>"ReleaseGroupType"
  belongs_to :name, :class_name=>"ReleaseName", :foreign_key=>'name'
  belongs_to :artist_credit, :foreign_key=>"artist_credit"
  has_many :releases, :foreign_key=>"release_group"
  
  def response(depth=3)
    @adjacencies  = Array.new
    @other_nodes  = Array.new
    self.releases.each do |release|
      self.adjacencies << self.make_adjacency(release)
      self.other_nodes << self.make_node(release)
    end
    
    self.data+self.other_nodes
  end
  
  
  def type
    "project"
  end
end
