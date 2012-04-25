class WmgTalentRoleIdentity < ActiveRecord::Base
  include GcdmAssociations
  
  self.table_name = "wmg_talent_role_identity"
  
  belongs_to :talent, :class_name=>"WmgTalent"
  belongs_to :role, :class_name=>"WmgRole", :foreign_key=>"role_code"
  
end
