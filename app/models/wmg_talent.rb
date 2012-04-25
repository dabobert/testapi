class WmgTalent < ActiveRecord::Base
  include NodeTools
  include GcdmAssociations
  
  self.table_name = "wmg_talent"
  self.primary_key =  'participant_id'
  
  has_many :talent_role_entities, :class_name=>"WmgTalentRoleIdentity", :foreign_key=>"talent_id"
  has_many :roles, :class_name=>"WmgRole", :foreign_key=>"role_id", :through=>:talent_role_entities
  
  def artists
    @artists ||=
      self.talent_role_entities.select("entity_id, entity").where("entity='Artist'").group("entity_id, entity").collect do |tre|
        tre.oo_entity
      end
  end

  
  def origin(depth=3)
    hash = self.response(depth)
    NodeTools::set_origin_height(hash)
  end
  

  def response(depth=3)
    @adjacencies  = Array.new
    @other_nodes  = Array.new
    if depth > 0
        #self.iterate(self.publishing_contracts, (depth-1))
        #self.iterate(self.recording_contracts, (depth-1))
        self.iterate(self.artists, (depth-1))
    end
    self.data+self.other_nodes
  end
end
