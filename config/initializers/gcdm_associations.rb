module GcdmAssociations
  
  def gcdm_type
    @gcdm_type ||= self.class.to_s.gsub("Wmg","")
  end
  
  def oo_talent_role_entities
    raise "Incompatible Traversal with #{self.class.to_s} to talent_role_entities" unless ["Asset","Artist","Work","Product"].include? self.gcdm_type
    WmgTalentRoleIdentity.where("entity='#{self.gcdm_type}' and entity_id='#{self.id}'")
  end
  
  def rights
    WmgRight.where("entity='#{self.gcdm_type}' and entity_id='#{self.id}'")
  end
  
  def oo_entity
    Kernel.const_get("Wmg#{entity}").find(self.entity_id)
  end
  
  def type
    self.gcdm_type.downcase
  end
  
  def gid
    "#{self.gcdm_type.downcase}#{self.id}"
  end
  
  
  def shape
    "circle"
  end
  
  def method_missing(method, *args, &block)
    if self.respond_to? "entity"
      return nil if self.entity != method.to_s.camelcase
      oo_entity
    else
      raise NoMethodError,
<<ERRORINFO
  method: #{method}
  args: #{args.inspect}
  on: #{self.to_yaml}
ERRORINFO
    end
  end
end