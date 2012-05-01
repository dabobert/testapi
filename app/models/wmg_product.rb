class WmgProduct < ActiveRecord::Base
  include NodeTools
  include GcdmAssociations
  
  self.table_name = 'wmg_product'
  self.primary_key = 'id'
  
  belongs_to :wmg_artist, :foreign_key=>"artist_id"
  belongs_to :project, :class_name=>"WmgProject", :foreign_key=>"project_id"
  has_many :components, :class_name=>"WmgComponent", :foreign_key=>"parent_product_id"
  has_many :assets, :class_name=>"WmgAsset", :through=>:components
  
  def name
    self.display_title
  end
  
  def response(depth=3)
    @adjacencies  = Array.new
    @other_nodes  = Array.new

    if depth > 0
      begin
        self.iterate(self.assets, (depth-1))
      rescue
      end
    end
    self.data+self.other_nodes
  end
end
