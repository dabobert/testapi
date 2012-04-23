class LabelAlias < ActiveRecord::Base
  set_table_name 'label_alias'
  belongs_to :label, :foreign_key=>"label"
  belongs_to :name, :class_name=>"LabelName", :foreign_key=>"name"
end
