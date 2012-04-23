class LabelType < ActiveRecord::Base
  set_table_name 'label_type'
  has_many :labels
end
