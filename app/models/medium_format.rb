class MediumFormat < ActiveRecord::Base
  set_table_name 'medium_format'
  has_many :mediums, :foreign_key=>'medium'
end
