class ReleaseLabel < ActiveRecord::Base
  set_table_name 'release_label'
  belongs_to :release, :foreign_key=>"release"
  belongs_to :label, :foreign_key=>"label"
end
