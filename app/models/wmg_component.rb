class WmgComponent < ActiveRecord::Base
  self.table_name = 'wmg_component'
  
  belongs_to :product, :class_name=>"WmgProduct", :foreign_key=>"parent_product_id"
  belongs_to :asset, :class_name=>"WmgAsset"
end
