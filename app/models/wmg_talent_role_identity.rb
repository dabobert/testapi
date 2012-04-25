class WmgTalentRoleIdentity < ActiveRecord::Base
  include GcdmAssociations
  
  self.table_name = "wmg_talent_role_identity"
  
  belongs_to :talent, :class_name=>"WmgTalent"
  belongs_to :role, :class_name=>"WmgRole", :foreign_key=>"role_code"

  
  def oo_entity
    Kernel.const_get("Wmg#{entity}").find(self.entity_id)
  end
  
  def asset
    return nil if self.entity != "Asset"
    oo_entity
  end
  
  def wmg_artist
    return nil if self.entity != "Artist"
    oo_entity
  end
  
  def work
    return nil if self.entity != "Work"
    oo_entity
  end
  
  def product
    return nil if self.entity != "Product"
    oo_entity
  end
  
end
