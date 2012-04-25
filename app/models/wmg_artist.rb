class WmgArtist < ActiveRecord::Base
  include GcdmAssociations
  
  self.table_name = 'wmg_artist'
  set_primary_key :artist_id
  default_scope :order=>:artist_id
  
  belongs_to :mb_artist, :class_name=>"Artist", :foreign_key=>"mb_id"
  has_many :products, :class_name=>"wmg_product", :foreign_key=>"artist_id"  
  
end