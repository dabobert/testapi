class WmgAsset < ActiveRecord::Base
  include NodeTools
  include GcdmAssociations
  
  self.table_name = 'wmg_asset'
  self.primary_key = 'id'

  belongs_to :project, :class_name=>"WmgProject"
  belongs_to :wmg_artist, :class_name=>"WmgArtist", :foreign_key=>"artist_id"
  has_many :components, :class_name=>"WmgComponent"
  has_many :products, :class_name=>"WmgProduct", :through=>:components
  has_many :rights, :class_name=>"WmgRight", :foreign_key=>'entity_id', :conditions=>"entity ='Asset'"

  def name
    self.display_title
  end
  
  def response(depth=3)
    @adjacencies  = Array.new
    @other_nodes  = Array.new

    if depth > 0
      #begin
        self.iterate(self.rights, (depth-1))
      #rescue
      #end
    end
    self.data+self.other_nodes
  end
end
