class WmgProject < ActiveRecord::Base
  self.table_name = 'wmg_project'
  self.primary_key = "project_id"
  
  belongs_to :contract, :class_name=>"WmgContract", :foreign_key=>"contract_id"
  has_many :products, :class_name=>"WmgProduct", :foreign_key=>"project_id"

  def name
    self.project_nm.titlecase
  end
end
