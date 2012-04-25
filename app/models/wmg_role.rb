class WmgRole < ActiveRecord::Base
  set_primary_key :role_id
  
  has_many :talent_role_entities, :class_name=>"WmgTalentRoleIdentity", :foreign_key=>"role_id"
  has_many :talents, :class_name=>"WmgTalent", :foreign_key=>"talent_id", :through=>:talent_role_entities
end
