class WmgTalent < ActiveRecord::Base
  self.table_name = "wmg_talent"
  set_primary_key :participant_id
  
  has_many :talent_role_entities, :class_name=>"WmgTalentRoleIdentity", :foreign_key=>"talent_id"
  has_many :roles, :class_name=>"WmgRole", :foreign_key=>"role_id", :through=>:talent_role_entities
end
