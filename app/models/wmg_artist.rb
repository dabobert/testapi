class WmgArtist < ActiveRecord::Base
  include GcdmAssociations
  include NodeTools
  
  self.table_name = 'wmg_artist'
  self.primary_key = "artist_id"
  default_scope :order=>:artist_id
  
  belongs_to :mb_artist, :class_name=>"Artist", :foreign_key=>"mb_id"
  has_many :contracts, :class_name=>"WmgContract", :foreign_key=>"entity_id"  
  has_many :products, :class_name=>"WmgProduct", :foreign_key=>"artist_id"
  
  def name
    self.artist_name
  end
  
  def recording_contracts
    self.contracts.where("contract_type = 'Recording'")
  end
  
  def publishing_contracts
    self.contracts.where("contract_type like '%Pub%'")
  end
  
  def response(depth=3)
    @adjacencies  = Array.new
    @other_nodes  = Array.new
    if depth > 0
      begin
        self.iterate(self.publishing_contracts, (depth-1))
        self.iterate(self.recording_contracts, (depth-1))
      rescue
      end
    end
    self.data+self.other_nodes
  end
    
end