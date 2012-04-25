class WmgProject < ActiveRecord::Base
  include NodeTools
  include GcdmAssociations
  
  self.table_name = 'wmg_project'
  self.primary_key = "project_id"
  
  belongs_to :contract, :class_name=>"WmgContract", :foreign_key=>"contract_id"
  has_many :products, :class_name=>"WmgProduct", :foreign_key=>"project_id"

  def name
    self.project_nm.titlecase
  end
  
  def color
    "blue"
  end

  def response(depth=3)
    @adjacencies  = Array.new
    @other_nodes  = Array.new
    if depth > 0
      begin
        self.iterate(self.products, (depth-1))
      rescue
      end
    end
    self.data+self.other_nodes
  end
end
