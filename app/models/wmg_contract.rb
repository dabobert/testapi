class WmgContract < ActiveRecord::Base
  self.table_name = 'wmg_contract'
  set_primary_key :contract_id
  
  belongs_to :wmg_artist, :class_name=>"WmgArtist", :foreign_key=>"entity_id"
  has_many :projects, :class_name=>"WmgProject"
end
