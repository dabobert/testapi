module GcdmAssociations
  
  def gcdm_type
    @gcdm_type ||= self.class.to_s.gsub("Wmg","")
  end
  
  def talent_role_entities
    WmgTalentRoleIdentity.where("entity='#{self.gcdm_type}' and entity_id='#{self.id}'")
  end
end