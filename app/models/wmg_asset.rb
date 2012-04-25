class WmgAsset < ActiveRecord::Base
  self.table_name = 'wmg_asset'
  
  belongs_to :project, :class_name=>"WmgProject"
  belongs_to :wmg_artist, :class_name=>"WmgArtist", :foreign_key=>"artist_id"
  has_many :components, :class_name=>"WmgComponent"
  has_many :products, :class_name=>"WmgProduct", :through=>:components
end
