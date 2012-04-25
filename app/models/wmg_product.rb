class WmgProduct < ActiveRecord::Base
  include GcdmAssociations
  
  self.table_name = 'wmg_product'
  
  belongs_to :wmg_artist, :foreign_key=>"artist_id"
  belongs_to :project, :class_name=>"WmgProject", :foreign_key=>"project_id"
  has_many :components, :class_name=>"WmgComponent", :foreign_key=>"parent_product_id"
  has_many :assets, :class_name=>"WmgAsset", :through=>:components
  
  def name
    self.display_title
  end
  
end
