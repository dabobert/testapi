class LabelName < ActiveRecord::Base
  self.table_name = 'label_name'
  has_many :labels, :foreign_key=>"name"
  has_many :label_aliases, :foreign_key=>"name"
  has_many :labels_via_aliases, :class_name=>"Label", :through=>:label_aliases
  
end
