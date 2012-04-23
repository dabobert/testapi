class ReleaseName < ActiveRecord::Base
  set_table_name 'release_name'
  has_many :releases, :foreign_key=>'name'
  has_many :release_groups, :foreign_key=>'name'
end
