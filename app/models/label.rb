class Label < ActiveRecord::Base
  self.table_name = 'label'
  belongs_to :name, :class_name=>"LabelName", :foreign_key=>"name"
  belongs_to :label_type 
  has_many :release_labels, :foreign_key=>"label"
  has_many :releases, :through=>:release_labels
  
  def color
    "green"
  end
  
end
