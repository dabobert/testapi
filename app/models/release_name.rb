class ReleaseName < ActiveRecord::Base
  set_table_name 'release_name'
  has_many :releases, :foreign_key=>'name'
  has_many :release_groups, :foreign_key=>'name'
  
  
  def to_s
    self.name
  end
  
  def type
    "Project"
  end
end
