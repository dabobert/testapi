class MediumFormat < ActiveRecord::Base
  self.table_name = 'medium_format'
  has_many :mediums, :foreign_key=>'medium'
end
