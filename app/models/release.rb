class Release < ActiveRecord::Base
  include NodeTools
  
  self.table_name = :release
  belongs_to :artist_credit, :foreign_key=>"artist_credit"
  belongs_to :name, :class_name=>"ReleaseName", :foreign_key=>'name'
  belongs_to :release_group, :foreign_key=>"release_group"
  has_many :release_labels, :foreign_key=>"release"
  has_many :labels, :through=>:release_labels
  has_many :mediums, :foreign_key=>'release'
  has_many :tracklists, :through=>:mediums

  def response(depth=3)
    @adjacencies  = Array.new
    @other_nodes  = Array.new
    if depth > 0
      self.adjacencies << self.make_adjacency(self.release_group)
      self.other_nodes << self.make_node(self.release_group)
      self.iterate(self.labels, (depth-1))
    end

    self.data+self.other_nodes
  end

  
  def type
    "product"
  end
end
