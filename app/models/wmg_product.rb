class WmgProduct < ActiveRecord::Base
  self.table_name = 'wmg_product'
  
  belongs_to :wmg_artist, :foreign_key=>"artist_id"
  has_many :components, :class_name=>"WmgComponent", :foreign_key=>"parent_product_id"
  has_many :assets, :class_name=>"WmgAsset", :through=>:components
end
