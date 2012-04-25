class WmgWork < ActiveRecord::Base
  include GcdmAssociations
  include NodeTools
  
  self.table_name = 'wmg_work'
  
  belongs_to :contract, :class_name=>"WmgContract", :foreign_key=>"contract_id"
  
  def response(depth=3)
    @adjacencies  = Array.new
    @other_nodes  = Array.new
    self.data+self.other_nodes
  end
  
  def name
    self.title
  end
  
end