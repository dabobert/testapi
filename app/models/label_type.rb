class LabelType < ActiveRecord::Base
  self.table_name = 'label_type'
  has_many :labels
end
