class WmgProject < ActiveRecord::Base
  self.table_name = 'wmg_artist'
  set_primary_key :project_id
  
  belongs_to :contract, :class_name=>"WmgContract"
end
