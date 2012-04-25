class WmgContract < ActiveRecord::Base
  include GcdmAssociations
  include NodeTools
  
  self.table_name = 'wmg_contract'
  self.primary_key =  "contract_id"
  
  belongs_to  :wmg_artist, :class_name=>"WmgArtist", :foreign_key=>"entity_id"
  has_many    :projects, :class_name=>"WmgProject", :foreign_key=>"contract_id"
  has_many    :works, :class_name=>"WmgWork", :foreign_key=>"contract_id"
  
  def name
    self.contract_name
  end
  
  def color
    "yellow"
  end
  
  def response(depth=3)
    @adjacencies  = Array.new
    @other_nodes  = Array.new
    if depth > 0
      #begin
        if (self.contract_type == "Recording")
          self.iterate(self.projects, (depth-1))
        else
          self.iterate(self.works, (depth-1))
        end
      #rescue
      #end
    end
    self.data+self.other_nodes
  end
  
end
