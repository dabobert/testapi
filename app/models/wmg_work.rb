class WmgWork < ActiveRecord::Base
  include GcdmAssociations
  include NodeTools
  
  self.table_name = 'wmg_work'
  
  belongs_to :contract, :class_name=>"WmgContract", :foreign_key=>"contract_id"
  belongs_to :talent, :class_name=>"WmgTalent", :foreign_key=>"talent_id"
  belongs_to :role, :class_name=>"WmgRole", :foreign_key=>"role_id"
  
  def name
    self.title
  end
  
end
